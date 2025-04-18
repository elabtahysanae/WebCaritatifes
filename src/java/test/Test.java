package test;

import dao2.UserDao;
import dao2.CategorieDao;
import dao2.CauseDao;
import dao2.DonDao;
import entities.Admin;
import entities.Donneur;
import entities.Categorie;
import entities.Cause;
import entities.Don;
import util.HibernateUtil;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        // Initialisation Hibernate
        HibernateUtil.getSessionFactory();

        // DAOs
        UserDao userDao = new UserDao();
        CategorieDao categorieDao = new CategorieDao();
        CauseDao causeDao = new CauseDao();
        DonDao donDao = new DonDao();

        // Création d'un admin
        Admin admin = new Admin("Souad", "souad@exemple.com", "Souad1234");
        userDao.create(admin);

        // Création de donneurs
        Donneur donneur1 = new Donneur("Sanae", "donneur1@exemple.com", "donneur1234");
        Donneur donneur2 = new Donneur("Kaoutar", "donneur2@exemple.com", "donneur0123");
        Donneur donneur3 = new Donneur("Aya", "donneur3@exemple.com", "donneur2345");

        userDao.create(donneur1);
        userDao.create(donneur2);
        userDao.create(donneur3);

        // Création de catégories
        Categorie catSante = new Categorie("Santé", new ArrayList<>());
        Categorie catEducation = new Categorie("Éducation", new ArrayList<>());

        categorieDao.create(catSante);
        categorieDao.create(catEducation);

        // Création de causes
        Cause cause1 = new Cause("Aide aux enfants malades", "Collecte de fonds pour les traitements", 10000);
        Cause cause2 = new Cause("Fournitures scolaires", "Aider les enfants à acheter des fournitures", 5000);

        causeDao.create(cause1);
        causeDao.create(cause2);

        
        // Création de dons
      Don don1 = new Don(500.0f, LocalDate.of(2025, 4, 5), cause1, donneur1);
      Don don2 = new Don(1000.0f, LocalDate.of(2025, 4, 6), cause1, donneur2);
      Don don3 = new Don(750.0f, LocalDate.now(), cause2, donneur3);


        donDao.create(don1);
        donDao.create(don2);
        donDao.create(don3);

        // Afficher toutes les causes
        System.out.println("\n--- Toutes les causes :");
        for (Cause c : causeDao.findAll()) {
            System.out.println(c);
        }

        // Afficher tous les dons pour une cause spécifique
        System.out.println("\n--- Dons pour la cause 'Aide aux enfants malades' :");
        for (Don d : donDao.findAll()) {
            if (d.getCause().getId() == cause1.getId()) {
                System.out.println("Don de " + d.getMontant() + "€ par " + d.getDonneur().getNom() + " le " + d.getDate());
            }
        }

        // Afficher les dons d'un utilisateur spécifique
        System.out.println("\n--- Dons effectués par Sanae :");
        for (Don d : donDao.findAll()) {
            if (d.getDonneur().getId() == donneur1.getId()) {
                System.out.println("Don de " + d.getMontant() + "€ pour la cause '" + d.getCause().getTitre() + "'");
            }
        }

        // Causes avec un objectif supérieur à 60000DH
        System.out.println("\n--- Causes avec objectif > 60000DH :");
        for (Cause c : causeDao.findAll()) {
            if (c.getObjectif() > 6000) {
                System.out.println(c.getTitre() + " (objectif : " + c.getObjectif() + "DH)");
            } else {
            }
        }
    }
}
