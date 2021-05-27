package com.tj.music.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tj.music.domain.Criteria;
import com.tj.music.domain.MusicVO;
import com.tj.music.domain.PageMaker;
import com.tj.music.domain.ReplyVO;
import com.tj.music.domain.SearchCriteria;
import com.tj.music.service.MusicService;
import com.tj.music.service.ReplyService;

@Controller
@RequestMapping("/music/*")
public class MusicController {

	@Inject
	MusicService service;
	
	@Inject
	ReplyService RepService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void getList(Model model) throws Exception{
		List<MusicVO> list=null;
		list = service.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public void getWrite() throws Exception{
		
	}
	
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String postWrite(MusicVO vo) throws Exception{
		service.write(vo);
		return "redirect:/music/listSearch";
	}
	
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		MusicVO vo = service.view(bno);
		model.addAttribute("view", vo);
		model.addAttribute("scri",scri);
		
		//댓글읽기 추가
		List<ReplyVO> repList = RepService.readReply(bno);
		model.addAttribute("repList", repList);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		MusicVO vo = service.view(bno);
		model.addAttribute("modify", vo);
		model.addAttribute("scri", scri);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String postModify(MusicVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		service.modify(vo);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/music/listSearch";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		model.addAttribute("delete", bno);
		model.addAttribute("scri", scri);
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		service.delete(bno);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/music/listSearch";
	}
	
	//리스트 + 페이징추가
	@RequestMapping(value="/listPage",method=RequestMethod.GET)
	public void getListPage(Model model,@ModelAttribute("cri") Criteria cri) throws Exception{
		List<MusicVO> list=null;
		list = service.listPage(cri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.count());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("select",cri.getPage());
	}
	
	//리스트 + 페이징추가 + 검색추가
		@RequestMapping(value="/listSearch",method=RequestMethod.GET)
		public void getListPageSearch(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
			List<MusicVO> list=null;
			list = service.listSearch(scri);
			model.addAttribute("list", list);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.countSearch(scri));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("select",scri.getPage());
			
			//검색조건 유지
			model.addAttribute("searchType", scri.getSearchType());
			model.addAttribute("keyword", scri.getKeyword());
		}
		
	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		 RepService.writeReply(vo);
		 rttr.addAttribute("bno", vo.getBno());
		 rttr.addAttribute("page", scri.getPage());
		 rttr.addAttribute("perPageNum", scri.getPerPageNum());
		 rttr.addAttribute("searchType", scri.getSearchType());
		 rttr.addAttribute("keyword", scri.getKeyword());
		 return "redirect:/music/view"; 
	}
	
}
