
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import entities.Donneur;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;


public class DonneurDao implements IDao<Donneur>{

    @Override
    public boolean create(Donneur o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            etat = true;
        }catch(HibernateException e){
            if(tx != null)
                tx.rollback();
        }finally{
            if(session != null)
                session.close();
        }
        return etat;
    }

    @Override
    public boolean delete(Donneur o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            etat = true;
        }catch(HibernateException e){
            if(tx != null)
                tx.rollback();
        }finally{
            if(session != null)
                session.close();
        }
        return etat;
    }

    @Override
    public boolean update(Donneur o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            etat = true;
        }catch(HibernateException e){
            if(tx != null)
                tx.rollback();
        }finally{
            if(session != null)
                session.close();
        }
        return etat;
    }

    @Override
    public List<Donneur> findAll() {
        Session session = null;
        Transaction tx = null;
        List<Donneur> donneurs = null;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            donneurs = session.createQuery("from Donneur").list();
            tx.commit();
        }catch(HibernateException e){
            if(tx != null)
                tx.rollback();
        }finally{
            if(session != null)
                session.close();
        }
        return donneurs;
    }

    @Override
    public Donneur findById(int id) {
        Session session = null;
        Transaction tx = null;
        Donneur donneur = null;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            donneur = (Donneur) session.get(Donneur.class, id);
            tx.commit();
        }catch(HibernateException e){
            if(tx != null)
                tx.rollback();
        }finally{
            if(session != null)
                session.close();
        }
        return donneur;
    }
    
}
