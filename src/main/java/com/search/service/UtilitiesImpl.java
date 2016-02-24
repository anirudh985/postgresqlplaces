package com.search.service;

import java.util.ArrayList;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.search.dao.SearchLocationDao;
import com.search.objects.SearchLocation;

@Service("utilitiesImpl")
public class UtilitiesImpl implements Utilities{

	private SearchLocationDao searchLocationDao;
	
	public void setSearchLocationDao(SearchLocationDao searchLocationDao) {
		this.searchLocationDao = searchLocationDao;
	}

	@Override
	public long getCount() {
		return searchLocationDao.getCount();
	}

	@Override
	public ArrayList<SearchLocation> getList() {
		return searchLocationDao.getAllLocations();
	}

	@Override
	public ArrayList<SearchLocation> search(String query) {
		return searchLocationDao.search(query);
	}

	@Override
	public ArrayList<SearchLocation> searchMulti(String name, String category) {
		return searchLocationDao.searchMulti(name, category);
	}
}
