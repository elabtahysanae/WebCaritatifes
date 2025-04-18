/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author elabtahysanae
 */

@Embeddable
public class DonId implements Serializable {

    @Column(name = "Cause_id")
    private int causeId;

    @Column(name = "Donneur_id")
    private int donneurId;

    public DonId() {
    }

    public DonId(int causeId, int donneurId) {
        this.causeId = causeId;
        this.donneurId = donneurId;
    }

    public int getCauseId() {
        return causeId;
    }

    public void setCauseId(int causeId) {
        this.causeId = causeId;
    }

    public int getDonneurId() {
        return donneurId;
    }

    public void setDonneurId(int donneurId) {
        this.donneurId = donneurId;
    }
     

    

   
}