package dao;

import java.util.List;

import model.Building;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BuildingDAO extends HibernateDaoSupport {
	
	public void save(Building building) {
		getHibernateTemplate().save(building); //save single user in db
	}
	
	@SuppressWarnings("unchecked")
	public List<Building> loadAll() {
		return getHibernateTemplate().loadAll(Building.class); //get all entries from db
	}
	public Building load(Building building1, Long id) {
		Building building;
		building = (Building)getHibernateTemplate().load(Building.class, id); //get all entries from db
		getHibernateTemplate().initialize(building) ;
		return building;
	}	
	
	public void delete(Building room) {
		getHibernateTemplate().delete(room); //delete single user in db
	}	
	public void update(Building room) {
		getHibernateTemplate().update(room); //delete single user in db
	}
}
