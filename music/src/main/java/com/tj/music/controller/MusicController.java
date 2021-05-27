package com.tj.music.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tj.music.domain.Criteria;
import com.tj.music.domain.MusicVO;
import com.tj.music.domain.PageMaker;
import com.tj.music.domain.SearchCriteria;
import com.tj.music.service.MusicService;

@Controller
@RequestMapping("/music/*")
public class MusicController {

	@Inject
	MusicService service;
	
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
		return "redirect:/music/list";
	}
	
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception{
		MusicVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception{
		MusicVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String postModify(MusicVO vo) throws Exception{
		service.modify(vo);
		return "redirect:/music/view?bno="+vo.getBno();
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception{
		service.delete(bno);
		return "redirect:/music/list";
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
	
	
}
