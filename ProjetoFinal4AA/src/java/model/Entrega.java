/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Entrega {
    
    private int idEntrega;
    private Entregador entregador;
    private int tipoEntrega;

    public Entrega() {
    }

    public Entrega(int idEntrega, Entregador entregador, int tipoEntrega) {
        this.idEntrega = idEntrega;
        this.entregador = entregador;
        this.tipoEntrega = tipoEntrega;
    }

    public int getTipoEntrega() {
        return tipoEntrega;
    }

    public void setTipoEntrega(int tipoEntrega) {
        this.tipoEntrega = tipoEntrega;
    }

    public int getIdEntrega() {
        return idEntrega;
    }

    public void setIdEntrega(int idEntrega) {
        this.idEntrega = idEntrega;
    }

    public Entregador getEntregador() {
        return entregador;
    }

    public void setEntregador(Entregador entregador) {
        this.entregador = entregador;
    }

    @Override
    public String toString() {
        return "Entrega{" + "idEntrega=" + idEntrega + ", entregador=" + entregador + ", tipoEntrega=" + tipoEntrega + '}';
    }
    
    
}
