package com.search.app;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.search.objects.SearchLocation;
import com.search.service.Utilities;

@Controller
public class AppController {

	private Utilities utilities;
	
	public void setUtilities(Utilities utilities) {
		this.utilities = utilities;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody ArrayList<SearchLocation> getList() {
		return utilities.getList();
	}
	
	
	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public @ResponseBody long getCount() {
		return utilities.getCount();
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody ArrayList<SearchLocation> search(@RequestParam("q") String query) {
		return utilities.search(query);
	}
	
//	@RequestMapping(value = "/searchMulti", method = RequestMethod.GET)
//	public @ResponseBody ArrayList<SearchLocation> searchMullti(@RequestParam("name") String name, @RequestParam("category") String category) {
//		return utilities.searchMulti(name, category);
//	}
	
	@RequestMapping(value = "/searchMulti", method = RequestMethod.POST)
	public @ResponseBody ArrayList<SearchLocation> searchMullti(@RequestBody SearchLocation placeQuery) {
		return utilities.searchMulti(placeQuery);
	}

}
