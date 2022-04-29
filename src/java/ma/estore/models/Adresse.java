/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.estore.models;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="ADRESSE"
    ,schema="ESTORE"
)
@SequenceGenerator(name = "seq_ad",sequenceName = "seq_ad")
public class Adresse  implements java.io.Serializable {


     private int ida;
     private Client client;
     private String adresse;
     private String ville;
     private Integer codepostale;
     private String pays;
     private Set<Commande> commandes = new HashSet<Commande>(0);

    public Adresse() {
    }

	
    public Adresse(int ida) {
        this.ida = ida;
    }
    public Adresse(int ida, Client client, String adresse, String ville, Integer codepostale, String pays, Set<Commande> commandes) {
       this.ida = ida;
       this.client = client;
       this.adresse = adresse;
       this.ville = ville;
       this.codepostale = codepostale;
       this.pays = pays;
       this.commandes = commandes;
    }
   
     @Id 

    @GeneratedValue(generator = "seq_ad",strategy = GenerationType.SEQUENCE)
    @Column(name="IDA", unique=true, nullable=false, precision=8, scale=0)
    public int getIda() {
        return this.ida;
    }
    
    public void setIda(int ida) {
        this.ida = ida;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="IDC")
    public Client getClient() {
        return this.client;
    }
    
    public void setClient(Client client) {
        this.client = client;
    }

    
    @Column(name="ADRESSE", length=100)
    public String getAdresse() {
        return this.adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    
    @Column(name="VILLE", length=50)
    public String getVille() {
        return this.ville;
    }
    
    public void setVille(String ville) {
        this.ville = ville;
    }

    
    @Column(name="CODEPOSTALE", precision=6, scale=0)
    public Integer getCodepostale() {
        return this.codepostale;
    }
    
    public void setCodepostale(Integer codepostale) {
        this.codepostale = codepostale;
    }

    
    @Column(name="PAYS", length=50)
    public String getPays() {
        return this.pays;
    }
    
    public void setPays(String pays) {
        this.pays = pays;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="adresse")
    public Set<Commande> getCommandes() {
        return this.commandes;
    }
    
    public void setCommandes(Set<Commande> commandes) {
        this.commandes = commandes;
    }




}
