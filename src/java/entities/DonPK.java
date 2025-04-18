/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Embeddable;

/**
 *
 * @author elabtahysanae
 */
@Embeddable
public class DonPK implements Serializable{
    private int etudiant;
    private int cours;
    private Date date;

    public DonPK() {
    }

    public DonPK(int etudiant, int cours, Date date) {
        this.etudiant = etudiant;
        this.cours = cours;
        this.date = date;
    }

    public int getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(int etudiant) {
        this.etudiant = etudiant;
    }

    public int getCours() {
        return cours;
    }

    public void setCours(int cours) {
        this.cours = cours;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
    
}
