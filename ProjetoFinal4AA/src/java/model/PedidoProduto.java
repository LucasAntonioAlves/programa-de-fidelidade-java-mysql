/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class PedidoProduto {
    private long idPedidoProduto;
    private int qtdVendida;
    private double valor;
    private Pedido pedido;
    private Produto produto;

    public PedidoProduto() {
    }

    public PedidoProduto(long idPedidoProduto, int qtdVendida, double valor, Pedido pedido, Produto produto) {
        this.idPedidoProduto = idPedidoProduto;
        this.qtdVendida = qtdVendida;
        this.valor = valor;
        this.pedido = pedido;
        this.produto = produto;
    }

    public long getIdPedidoProduto() {
        return idPedidoProduto;
    }

    public void setIdPedidoProduto(long idPedidoProduto) {
        this.idPedidoProduto = idPedidoProduto;
    }

    public int getQtdVendida() {
        return qtdVendida;
    }

    public void setQtdVendida(int qtdVendida) {
        this.qtdVendida = qtdVendida;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public String toString() {
        return "PedidoProduto{" + "idPedidoProduto=" + idPedidoProduto + ", qtdVendida=" + qtdVendida + ", valor=" + valor + ", pedido=" + pedido + ", produto=" + produto + '}';
    }
    
    
    
}
