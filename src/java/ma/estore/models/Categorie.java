package ma.estore.models;
// Generated 12 mars 2022 22:36:01 by Hibernate Tools 4.3.1


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Categorie generated by hbm2java
 */
@Entity
@Table(name="CATEGORIE"
    ,schema="ESTORE"
)
public class Categorie  implements java.io.Serializable {


     private long idcat;
     private String libelle;
     private String description;
     private List<Produit> produits = new ArrayList<Produit>(0);

    public Categorie() {
    }

	
    public Categorie(long idcat) {
        this.idcat = idcat;
    }
    public Categorie(long idcat, String libelle, String description, List<Produit> produits) {
       this.idcat = idcat;
       this.libelle = libelle;
       this.description = description;
       this.produits = produits;
    }
   
     @Id 

    
    @Column(name="IDCAT", unique=true, nullable=false, precision=10, scale=0)
    public long getIdcat() {
        return this.idcat;
    }
    
    public void setIdcat(long idcat) {
        this.idcat = idcat;
    }

    
    @Column(name="LIBELLE", length=30)
    public String getLibelle() {
        return this.libelle;
    }
    
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    
    @Column(name="DESCRIPTION", length=200)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY, mappedBy="categorie")
    public List<Produit> getProduits() {
        return this.produits;
    }
    
    public void setProduits(List<Produit> produits) {
        this.produits = produits;
    }




}


