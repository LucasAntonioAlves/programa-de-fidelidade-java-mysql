/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author LucasPC
 */
public class Cliente {
    private int idCliente;
    private String nome;
    private String cpfCnpj;
    private int quantidadePedidos;
    private String endereco;
    private Date dataNascAbertura;
    private int tipo;

    public Cliente() {
    }

    public Cliente(int idCliente, String nome, String cpfCnpj, int quantidadePedidos, String endereco, Date dataNascAbertura, int tipo) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.cpfCnpj = cpfCnpj;
        this.quantidadePedidos = quantidadePedidos;
        this.endereco = endereco;
        this.dataNascAbertura = dataNascAbertura;
        this.tipo = tipo;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfCnpj() {
        return cpfCnpj;
    }

    public void setCpfCnpj(String cpfCnpj) {
        this.cpfCnpj = cpfCnpj;
    }

    public int getQuantidadePedidos() {
        return quantidadePedidos;
    }

    public void setQuantidadePedidos(int quantidadePedidos) {
        this.quantidadePedidos = quantidadePedidos;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Date getDataNascAbertura() {
        return dataNascAbertura;
    }

    public void setDataNascAbertura(Date dataNascAbertura) {
        this.dataNascAbertura = dataNascAbertura;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Cliente{" + "nome=" + nome + '}';
    }
    
    
    
}
