/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Entregador {
    private int idEntregador;
    private String nome;

    public Entregador() {
    }

    public Entregador(int idEntregador, String nome) {
        this.idEntregador = idEntregador;
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdEntregador() {
        return idEntregador;
    }

    public void setIdEntregador(int idEntregador) {
        this.idEntregador = idEntregador;
    }

    @Override
    public String toString() {
        return "Entregador{" + "idEntregador=" + idEntregador + ", nome=" + nome + '}';
    }
    
    
}
