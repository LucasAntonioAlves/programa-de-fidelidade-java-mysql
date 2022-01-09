/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

public class Pedido {
    private int idPedido;
    private Date data;
    private Date horario;
    private int formaPagamento;
    private double total;
    private int status;
    private int tipoPedido;
    private Entrega entrega;
    private Usuario vendedor;
    private Cliente cliente;
    private ArrayList<PedidoProduto> carrinho;

    public Pedido() {
    }

    public Pedido(int idPedido, Date data, Date horario, int formaPagamento, double total, int status, int tipoPedido, Entrega entrega, Usuario vendedor, Cliente cliente, ArrayList<PedidoProduto> carrinho) {
        this.idPedido = idPedido;
        this.data = data;
        this.horario = horario;
        this.formaPagamento = formaPagamento;
        this.total = total;
        this.status = status;
        this.tipoPedido = tipoPedido;
        this.entrega = entrega;
        this.vendedor = vendedor;
        this.cliente = cliente;
        this.carrinho = carrinho;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getHorario() {
        return horario;
    }

    public void setHorario(Date horario) {
        this.horario = horario;
    }

    public int getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(int formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getTipoPedido() {
        return tipoPedido;
    }

    public void setTipoPedido(int tipoPedido) {
        this.tipoPedido = tipoPedido;
    }

    public Usuario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Usuario vendedor) {
        this.vendedor = vendedor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Entrega getEntrega() {
        return entrega;
    }

    public void setEntrega(Entrega entrega) {
        this.entrega = entrega;
    }

    public ArrayList<PedidoProduto> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<PedidoProduto> carrinho) {
        this.carrinho = carrinho;
    }

    @Override
    public String toString() {
        return "Pedido{" + "idPedido=" + idPedido + ", data=" + data + ", horario=" + horario + ", FormaPagamento=" + formaPagamento + ", total=" + total + ", tipoPedido=" + tipoPedido + ", entrega=" + entrega + ", vendedor=" + vendedor + ", cliente=" + cliente + ", carrinho=" + carrinho + '}';
    }
    
    
    
}
