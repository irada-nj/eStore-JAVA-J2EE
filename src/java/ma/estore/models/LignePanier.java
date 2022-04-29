/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.estore.models;

/**
 *
 * @author IRADA
 */
public class LignePanier {
    private Produit produit;
    private int qte;

    public LignePanier(Produit produit, int qte) {
        this.produit = produit;
        this.qte = qte;
    }

    public Produit getProduit() {
        return produit;
    }

    public void setP(Produit p) {
        this.produit = produit;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }
    
    
    
}
