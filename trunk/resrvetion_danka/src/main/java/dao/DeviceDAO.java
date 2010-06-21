package dao;

import java.util.Collection;

import model.Device;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class DeviceDAO extends HibernateDaoSupport {
	
	public void save(Device device) {
		getHibernateTemplate().save(device); //save single user in db
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Device> searchForDevices(Long id) {
		String query = "from Device device where device.reservation.id="+id;
		Collection<Device> result = getHibernateTemplate().find(query);
		return result;
	}
	@SuppressWarnings("unchecked")
	public Collection<Device> loadAll() {
		return getHibernateTemplate().loadAll(Device.class); //get all entries from db
	}
	public Device load(Device device, Long id) {
		Device device2;
		device2 = (Device)getHibernateTemplate().load(Device.class, id); //get all entries from db
		getHibernateTemplate().initialize(device2) ;
		return device2;
	}	
	
	public void delete(Device device) {
		getHibernateTemplate().delete(device); //delete single user in db
	}	
	public void update(Device device) {
		getHibernateTemplate().update(device); //delete single user in db
	}
}
