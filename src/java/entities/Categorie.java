/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.List;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

/**
 *
 * @author elabtahysanae
 */
@Entity
@Table(name= "categories")
public class Categorie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id ;
    private String nom ;
    
    @OneToMany(mappedBy = "categorie", fetch = FetchType.EAGER)
    private List<Cause> causes;

    public Categorie() {
    }

    public Categorie(String nom, List<Cause> causes) {
        this.nom = nom;
        this.causes = causes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Cause> getCauses() {
        return causes;
    }

    public void setCauses(List<Cause> causes) {
        this.causes = causes;
    }
    
  
}

