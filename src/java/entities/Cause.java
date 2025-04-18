/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author elabtahysanae
 */
@Entity
@Table(name= "causes")
public class Cause {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id ;
    private String titre ;
    private String description ;
    private float objectif ;
    
    @ManyToOne
    @JoinColumn(name = "categories_id")
    private Categorie categorie;

    
    @OneToMany(mappedBy = "cause")
    private List<Don> dons;

    public Cause() {
    }

    public Cause( String titre, String description, float objectif) {
       
        this.titre = titre;
        this.description = description;
        this.objectif = objectif;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getObjectif() {
        return objectif;
    }

    public void setObjectif(float objectif) {
        this.objectif = objectif;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public List<Don> getDons() {
        return dons;
    }

    public void setDons(List<Don> dons) {
        this.dons = dons;
    }

    
   @Override
public String toString() {
    return "La cause \"" + titre + "\" (ID : " + id + ") a pour objectif " + objectif + "DH, avec la description : \"" + description + "\".";
}


    
    
  
}
    


    
    