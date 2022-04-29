package ma.estore.models;
// Generated 12 mars 2022 22:36:01 by Hibernate Tools 4.3.1


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Client generated by hbm2java
 */
@Entity
@Table(name="CLIENT"
    ,schema="ESTORE"
)
@SequenceGenerator(name = "seq_clt",sequenceName = "seq_clt")
public class Client  implements java.io.Serializable {


     private int idc;
     private Compte compte;
     private String nom;
     private String prenom;
     private String email;
     private String tel;
     private Date regdate;
     private Set<Wishlist> wishlists = new HashSet<Wishlist>(0);
     private Set<Commande> commandes = new HashSet<Commande>(0);
    // private Set<Adresse> adresses = new HashSet<Adresse>(0);
     //, Set<Commande> commandes,Set<Adresse> adresses
     
    public Client() {
    }

	
    public Client(int idc) {
        this.idc = idc;
    }
    public Client(int idc, Compte compte, String nom, String prenom, String email, String tel, Date regdate, Set<Wishlist> wishlists, Set<Commande> commandes) {
       this.idc = idc;
       this.compte = compte;
       this.nom = nom;
       this.prenom = prenom;
       this.email = email;
       this.tel = tel;
       this.regdate = regdate;
       this.wishlists = wishlists;
       this.commandes = commandes;
     
       
    }

    /*public Client(int i, Compte cpt, String nom, String prenom, String email, Object object, Date date, Object object0, Object object1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/

       
     @Id 

    @GeneratedValue(generator = "seq_clt",strategy = GenerationType.SEQUENCE)
    @Column(name="IDC", unique=true, nullable=false, precision=10, scale=0)
    public int getIdc() {
        return this.idc;
    }
    
    public void setIdc(int idc) {
        this.idc = idc;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="LOGIN")
    public Compte getCompte() {
        return this.compte;
    }
    
    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    
    @Column(name="NOM")
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }

    
    @Column(name="PRENOM")
    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    
    @Column(name="EMAIL", length=50)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="TEL", length=30)
    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="REGDATE", length=7)
    public Date getRegdate() {
        return this.regdate;
    }
    
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="client")
    public Set<Wishlist> getWishlists() {
        return this.wishlists;
    }
    
    public void setWishlists(Set<Wishlist> wishlists) {
        this.wishlists = wishlists;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="client")
    public Set<Commande> getCommandes() {
        return this.commandes;
    }
    
    public void setCommandes(Set<Commande> commandes) {
        this.commandes = commandes;
    }

   




}