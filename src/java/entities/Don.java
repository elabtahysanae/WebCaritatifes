/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author elabtahysanae
 */
@Entity
@Table(name= "dons")
public class Don {
    @EmbeddedId
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private DonId id ;
    private float montant ;
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "cause_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Cause cause;

    @ManyToOne
    @JoinColumn(name = "donneur_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Donneur donneur;

    
    
    public Don() {
    }

    public Don(float montant, LocalDate date, Cause cause, Donneur donneur) {
        this.montant = montant;
        this.date = date;
        this.cause = cause;
        this.donneur = donneur;
    }

    

    public DonId getId() {
        return id;
    }

    public void setId(DonId id) {
        this.id = id;
    }

    public float getMontant() {
        return montant;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Cause getCause() {
        return cause;
    }

    public void setCause(Cause cause) {
        this.cause = cause;
    }

    public Donneur getDonneur() {
        return donneur;
    }

    public void setDonneur(Donneur donneur) {
        this.donneur = donneur;
    }

    @Override
    public String toString() {
        return "Don{" + "id=" + id + ", montant=" + montant + ", date=" + date + ", cause=" + cause + ", donneur=" + donneur + '}';
    }

  
    
    
}
   
