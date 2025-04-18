/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

/**
 *
 * @author elabtahysanae
 */
import dao.DonneurDao;
import entities.Donneur;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;


public class DonneurService implements IService<Donneur> {

    private final DonneurDao dd;

    public DonneurService() {
        this.dd = new DonneurDao();
    }

    public DonneurService(DonneurDao dd) {
        this.dd = dd;
    }

   public Donneur findClientByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        Donneur donneur = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            donneur = (Donneur) session.getNamedQuery("findClientByEmail").setParameter("email", email).uniqueResult();
            tx.commit();
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return donneur;
    }
    @Override
    public boolean create(Donneur o) {
        return dd.create(o);
    }

    @Override
    public boolean delete(Donneur o) {
        return dd.delete(o);
    }

    @Override
    public boolean update(Donneur o) {
        return dd.update(o);
    }

    @Override
    public List<Donneur> findAll() {
        return dd.findAll();
    }

    @Override
    public Donneur findById(int id) {
        return dd.findById(id);
    }

}
