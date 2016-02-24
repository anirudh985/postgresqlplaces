package com.search.dao;

import java.util.ArrayList;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.search.objects.SearchLocation;

public class SearchLocationDao extends HibernateDaoSupport{
	
	public ArrayList<SearchLocation> getAllLocations(){
		DetachedCriteria criteria = DetachedCriteria.forClass(SearchLocation.class);
		ArrayList<SearchLocation> list = (ArrayList<SearchLocation>) getHibernateTemplate().findByCriteria(criteria);
		return list;
	}
	
	public long getCount(){
		DetachedCriteria criteria = DetachedCriteria.forClass(SearchLocation.class);
		criteria.setProjection(Projections.rowCount());
		return (long) getHibernateTemplate().findByCriteria(criteria).get(0);
	}
	
	public ArrayList<SearchLocation> search(String query){
		String[] q = query.split(",");
		String locNameValue=null;
		String categoryValue=null;
		for(int i = 0; i < q.length; i++){
			String f[] = q[i].split(":");
			if(f[0].equalsIgnoreCase("name")) locNameValue = f[1];
			else if(f[0].equalsIgnoreCase("category")) categoryValue = f[1];
		}
		DetachedCriteria criteria = DetachedCriteria.forClass(SearchLocation.class);
		Criterion locCriteria = Restrictions.like("locName", locNameValue, MatchMode.ANYWHERE);
		Criterion categoryCriteria = Restrictions.like("category", categoryValue, MatchMode.ANYWHERE);
		if(locNameValue != null && categoryValue != null)
			criteria.add(Restrictions.and(locCriteria, categoryCriteria));
		else
			criteria.add(Restrictions.or(locCriteria, categoryCriteria));
		
		return (ArrayList<SearchLocation>) getHibernateTemplate().findByCriteria(criteria);
	}

	public ArrayList<SearchLocation> searchMulti(String name, String category) {
		DetachedCriteria criteria = DetachedCriteria.forClass(SearchLocation.class);
		Criterion locCriteria = Restrictions.like("locName", "%"+name+"%", MatchMode.ANYWHERE);
		Criterion categoryCriteria = Restrictions.like("category", "%"+category+"%", MatchMode.ANYWHERE);
		if(name != null && category != null)
			criteria.add(Restrictions.and(locCriteria, categoryCriteria));
		else
			criteria.add(Restrictions.or(locCriteria, categoryCriteria));
		
		return (ArrayList<SearchLocation>) getHibernateTemplate().findByCriteria(criteria);
	}
}
