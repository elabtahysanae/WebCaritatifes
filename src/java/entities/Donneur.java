package entities;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import org.hibernate.annotations.NamedNativeQuery;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@NamedQueries({
    @NamedQuery(name = "findByNom", query = "from Donneur where nom  =:nom"),
    @NamedQuery(name  ="findByEmail", query = "from Donneur where emal =:email")
})

@NamedNativeQuery(name="findCours", query = "SELECT c.* FROM Cause c inner JOIN Dons dn on cn.id = c.Cause INNER JOIN Donneur d on d.id = dn.Donneur where d.id=:id", resultClass = Cause.class)

public class Donneur extends User {
    @OneToMany(mappedBy = "donneur")
    private List<Don> dons;

    public Donneur() {
    }
   

    public Donneur(String nom, String email, String motDePasse) {
        super(nom, email, motDePasse);
    }

    public List<Don> getDons() {
        return dons;
    }

    public void setDons(List<Don> dons) {
        this.dons = dons;
    }
    

    
  
}
   
    
            



