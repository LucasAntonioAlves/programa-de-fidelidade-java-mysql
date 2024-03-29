/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author LucasPC
 */
public class Menu {
    
    private int idMenu;
    private String nome;
    private String icone;
    private String link;
    private int exibir;

    public Menu() {
    }

    public Menu(int idMenu, String nome, String icone, String link, int exibir) {
        this.idMenu = idMenu;
        this.nome = nome;
        this.icone = icone;
        this.link = link;
        this.exibir = exibir;
    }

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getExibir() {
        return exibir;
    }

    public void setExibir(int exibir) {
        this.exibir = exibir;
    }

    @Override
    public String toString() {
        return "Menu{" + "nome=" + nome + '}';
    }
    
    
}
