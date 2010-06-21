package dao;

import java.util.Collection;
import java.util.List;

import model.Reservation;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class ReservationDAO extends HibernateDaoSupport{

	public void save(Reservation reservation) {
		getHibernateTemplate().save(reservation); //save single user in db
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Reservation> loadAll() {
		return getHibernateTemplate().loadAll(Reservation.class); //get all entries from db
	}
	
	@SuppressWarnings("unchecked")
	public Long getUserId(String userName){
		Long id = 0L;
		
		String query = "select user.id from User user where user.username='"+userName+"'";
		
		List<Object> result = getHibernateTemplate().find(query);
		if(result.size() > 0)
			return (Long)result.get(0);
		
		return id;
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Reservation> loadUserReservations(Long userId){
		
		String query = "from Reservation reservation where reservation.user.id="+userId;
	
		Collection<Reservation> result = getHibernateTemplate().find(query);
		return result;
	}
	@SuppressWarnings("unchecked")
	public Collection<Reservation> search(Reservation reservation) {
		String query = "from Reservation reservation ";

		if (reservation.getUser().getId() != null)
			query += " where reservation.user.id="+reservation.getUser().getId();
		Collection<Reservation> result = getHibernateTemplate().find(query);
		return result;
	}
	
	public Reservation load(Reservation reservation1, Long id) {
		Reservation reservation;
		reservation = (Reservation)getHibernateTemplate().load(Reservation.class, id); //get all entries from db
		getHibernateTemplate().initialize(reservation) ;
		return reservation;
	}
	public void delete(Reservation reservation) {
		getHibernateTemplate().delete(reservation); //delete single user in db
	}	
	public void update(Reservation reservation) {
		getHibernateTemplate().update(reservation); //delete single user in db
	}	
}
