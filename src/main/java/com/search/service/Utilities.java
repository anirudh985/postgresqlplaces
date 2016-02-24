package com.search.service;

import java.util.ArrayList;

import com.search.objects.SearchLocation;

public interface Utilities {
	public long getCount();
	public ArrayList<SearchLocation> getList();
	public ArrayList<SearchLocation> search(String query);
	public ArrayList<SearchLocation> searchMulti(String name, String category);
}
