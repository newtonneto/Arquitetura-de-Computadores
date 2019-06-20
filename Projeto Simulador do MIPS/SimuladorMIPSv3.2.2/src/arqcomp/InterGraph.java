package arqcomp;
import java.awt.Color;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

public class InterGraph extends javax.swing.JFrame {
    
    DecimalFormat dfReg = new DecimalFormat("00000");
    DecimalFormat dfImm = new DecimalFormat("0000000000000000");
    DecimalFormat dfTgt = new DecimalFormat("00000000000000000000000000");
    String codigoBinario, codigoMIPS, complementoBin;
    String opcode, instr, rs, rt, rd, shamt, funct, immediate;

    public InterGraph() {
        initComponents();
        setIcon();
        initTableReg();
        jTextBinario.setEditable(false);
        jTextMIPS.setEditable(false);
        jLabelTextoAleatorioQueNinguemLiga.setText("<html><body>Programa desenvolvido utilizando a metodologia POG<br><center>Programação Orientada a Gambiarra</center><br><br>Izzy_New2<br>Beta Build 3.2.2v</body></html>");
    }
    
    public void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("03.jpg")));
    }
    
    /*Inicializa a tabela de registradores*/
    public void initTableReg() {
        for (int i = 0; i < 32; i++) {
            jTableRegistradores.setValueAt("0", i, 1);
        }
    }
    
    /*Converse registrador em inteiro*/
    public int converteReg(String reg) {
        return Integer.parseInt(reg.replace("$", ""));
    }
    
    /*Operações*/
    public int opAddi(String rs, String imm) {
        rs = rs.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        return valorEmRs + Integer.parseInt(imm);
    }
    
    public int opAdd(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return valorEmRs + valorEmRt;
    }
    
    public int opSub(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return valorEmRs - valorEmRt;
    }
    
    public int opAnd(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return valorEmRs & valorEmRt;
    }
    
    public int opAndi(String rs, String imm) {
        rs = rs.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        
        return valorEmRs & Integer.parseInt(imm);
    }
    
    public int opOr(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return valorEmRs | valorEmRt;
    }
    
    public int opOri(String rs, String imm) {
        rs = rs.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        
        return valorEmRs | Integer.parseInt(imm);
    }
    
    public int opXor(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return valorEmRs ^ valorEmRt;
    }
    
    public int opXori(String rs, String imm) {
        rs = rs.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        
        return valorEmRs ^ Integer.parseInt(imm);
    }
    
    public int opNor(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        
        return ~(valorEmRs | valorEmRt);
    }
    
    public int opSlt(String rs, String rt) {
        rs = rs.replace("$", "");
        rt = rt.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        int umOuZero;
        
        if (valorEmRs < valorEmRt) {
            umOuZero = 1;
        }
        else {
            umOuZero = 0;
        }
        
        return umOuZero;
    }
    
    public int opSlti(String rs, String imm) {
        rs = rs.replace("$", "");
        int valorEmRs = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rs), 1).toString());
        int umOuZero;
        
        if (valorEmRs < Integer.parseInt(imm)) {
            umOuZero = 1;
        }
        else {
            umOuZero = 0;
        }
        
        return umOuZero;
    }
    
    public int opSra(String rt, String shamt) {
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        /*int valorEmShamt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(shamt), 1).toString());*/
        int valorEmShamt = Integer.parseInt(shamt);
        int rtDeslocado = valorEmRt >> valorEmShamt;
        
        return rtDeslocado;
    }
    
    public int opSrl(String rt, String shamt) {
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        /*int valorEmShamt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(shamt), 1).toString());*/
        int valorEmShamt = Integer.parseInt(shamt);
        int rtDeslocado = valorEmRt >>> valorEmShamt;
        
        return rtDeslocado;
    }
    
    public int opSll(String rt, String shamt) {
        int valorEmRt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(rt), 1).toString());
        /*int valorEmShamt = Integer.parseInt(jTableRegistradores.getValueAt(Integer.parseInt(shamt), 1).toString());*/
        int valorEmShamt = Integer.parseInt(shamt);
        int rtDeslocado = valorEmRt << valorEmShamt;
        
        return rtDeslocado;
    }
    
    public int opLui(String imm) {
        return Integer.parseInt(imm) << 16;
    }
    
    /*Função das instruções tipo J - Bin to MIPS*/
    public String instrJ(String opcode, String codigoBinario) {
        String instrucao;
        
        if (opcode.equals("000010")) {
            instrucao = "j ".concat(String.valueOf(Integer.parseInt(codigoBinario.substring(6, 32), 2)));
        }
        else {
            instrucao = "jal ".concat(String.valueOf(Integer.parseInt(codigoBinario.substring(6, 32), 2)));
        }
        return instrucao;
    }
    
    /*Funções das instruções tipo I - Bin to MIPS*/
    public String instrItype1(String instr, String rt, String rs, String immediate) {
        /*return instr.concat(" $" + String.valueOf(Integer.parseInt(codigoBinario.substring(11, 16), 2)) + " $" + String.valueOf(Integer.parseInt(codigoBinario.substring(6, 11), 2)) + " $" + String.valueOf(Integer.parseInt(codigoBinario.substring(16, 32), 2)));*/
        return instr.concat(" $" + rt + " $" + rs + " " + immediate);
    }
    
    public String instrItype2(String instr, String rs, String label) {
        return instr.concat(" $" + rs + " " + label);
    }
    
    public String instrItype3(String instr, String rt, String immediate, String rs) {
        return instr.concat(" $" + rt + " " + immediate + "($" + rs + ")");
    }
    
    /*Funções do tipo R - MIPS to Bin*/
    /*Funcão para padrão "rd rs rt"*/
    public String instrPadrao1(String codigoMIPS) {
        String rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[3]));
        
        rd = dfReg.format(Integer.parseInt(rd));
        rs = dfReg.format(Integer.parseInt(rs));
        rt = dfReg.format(Integer.parseInt(rt));
        
        return (rs + rt + rd);
    }
    
    /*Funcão para padrão "rs rt"*/
    public String instrPadrao2(String codigoMIPS) {
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        
        rs = dfReg.format(Integer.parseInt(rs));
        rt = dfReg.format(Integer.parseInt(rt));
        
        return (rs + rt);
    }
    
    /*Função para padrão "rd rt sa"*/
    public String instrPadrao3(String codigoMIPS) {
        String rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String sa = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[3]));
        
        rd = dfReg.format(Integer.parseInt(rd));
        rt = dfReg.format(Integer.parseInt(rt));
        sa = dfReg.format(Integer.parseInt(sa));
        
        return (rt + rd + sa);
    }
    
    /*Função para padrão "rd rt rs"*/
    public String instrPadrao4(String condigoMIPS) {
        String rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[3]));
        
        rd = dfReg.format(Integer.parseInt(rd));
        rt = dfReg.format(Integer.parseInt(rt));
        rs = dfReg.format(Integer.parseInt(rs));
        
        return (rs + rt + rd);
    }
    
    /*Função do tipo J - MIPS to Bin*/
    /*Função para converter o address/target*/
    public String converteTarget(String codigoMIPS) {
        return dfTgt.format(Integer.parseInt(Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]))));
    }
    
    /*Funções do tipo I - MIPS to Bin*/
    /*Função para padrão "rt rs imm"*/
    public String instrIPadrao1(String codigoMIPS) {
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String imm = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[3]));
        
        rt = dfReg.format(Integer.parseInt(rt));
        rs = dfReg.format(Integer.parseInt(rs));
        imm = dfImm.format(Integer.parseInt(imm));
        
        return (rs + rt + imm);
    }
    
    /*Função para padrão "rs rt label*/
    public String instrIPadrao2(String codigoMIPS) {
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String imm = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[3]));
        
        rs = dfReg.format(Integer.parseInt(rs));
        rt = dfReg.format(Integer.parseInt(rt));
        imm = dfImm.format(Integer.parseInt(imm));
        
        return (rs + rt + imm);
    }
    
    /*Função para padrão "rs label"*/
    public String instrIPadrao3(String codigoMIPS) {
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String imm = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        
        rs = dfReg.format(Integer.parseInt(rs));
        imm = dfImm.format(Integer.parseInt(imm));
        
        return (rs + "00000" + imm);
    }
    
    /*Função para padrão "rt imm(rs)"*/
    public String instrIPadrao4(String codigoMIPS) {
        String rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
        String imm = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
        String rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split("(")[1]));
        rs = rs.replace(")", "");
        
        rt = dfReg.format(Integer.parseInt(rt));
        imm = dfImm.format(Integer.parseInt(imm));
        rs = dfReg.format(Integer.parseInt(rs));
        
        return (rs + rt + imm);
    }
    
    public String grandeFuncaoQueFazAPohaToda(boolean tipoDeConversao, String codigoBinario) {
        labelErro.setForeground(Color.red);
        String resultadoDaConversao = "WTF MERMÃO????";
        
        if (tipoDeConversao) {
            jTextBinario.setEditable(true);
            jTextMIPS.setEditable(false);
            /*codigoBinario = jTextBinario.getText();*/
            /*opcode = Integer.parseInt(codigoBinario.substring(0, 6), 2);*/
            opcode = codigoBinario.substring(0, 6);
            /*jTextMIPS.setText(String.valueOf(opcode));*/

            if (opcode.equals("000000")) {
                jTextTipo.setText("R");
                rs = String.valueOf(Integer.parseInt(codigoBinario.substring(6, 11), 2));
                rt = String.valueOf(Integer.parseInt(codigoBinario.substring(11, 16), 2));
                rd = String.valueOf(Integer.parseInt(codigoBinario.substring(16, 21), 2));
                shamt = String.valueOf(Integer.parseInt(codigoBinario.substring(21, 26), 2));
                funct = codigoBinario.substring(26, 32);

                /*jTextMIPS.setText(opcode + " " + String.valueOf(rs) + " " + String.valueOf(rt) + " " + String.valueOf(rd) + " " + String.valueOf(shamt) + " " + String.valueOf(funct));*/

                switch(funct) {
                    case "100000":
                        resultadoDaConversao = ("add " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opAdd(rs, rt), converteReg(rd), 1);
                        break;
                    case "100001":
                        resultadoDaConversao = ("addu " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opAdd(rs, rt), converteReg(rd), 1);
                        break;
                    case "100100":
                        resultadoDaConversao = ("and " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opAnd(rs, rt), converteReg(rd), 1);
                        break;
                    case "001101":
                        resultadoDaConversao = ("break");
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "011010":
                        resultadoDaConversao = ("div " + "$" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "011011":
                        resultadoDaConversao = ("divu " + "$" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "001001":
                        resultadoDaConversao = ("jarl " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "001000":
                        resultadoDaConversao = ("jr " + "$" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "010000":
                        resultadoDaConversao = ("mfhi " + "$" + String.valueOf(rd));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "010010":
                        resultadoDaConversao = ("mflo " + "$" + String.valueOf(rd));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "010001":
                        resultadoDaConversao = ("mthi " + "$" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "010011":
                        resultadoDaConversao = ("mtlo " + "$" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "011000":
                        resultadoDaConversao = ("mult " + "$" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "011001":
                        resultadoDaConversao = ("multu " + "$" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "100111":
                        resultadoDaConversao = ("nor " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opNor(rs, rt), converteReg(rd), 1);
                        break;
                    case "100101":
                        resultadoDaConversao = ("or " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opOr(rs, rt), converteReg(rd), 1);
                        break;
                    case "000000":
                        resultadoDaConversao = ("sll " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(shamt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSll(rt, shamt), converteReg(rd), 1);
                        break;
                    case "000100":
                        resultadoDaConversao = ("sllv " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "101010":
                        resultadoDaConversao = ("slt " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSlt(rs, rt), converteReg(rd), 1);
                        break;
                    case "101011":
                        resultadoDaConversao = ("sltu " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSlt(rs, rt), converteReg(rd), 1);
                        break;
                    case "000011":
                        resultadoDaConversao = ("sra " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(shamt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSra(rt, shamt), converteReg(rd), 1);
                        break;
                    case "000111":
                        resultadoDaConversao = ("srav " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "000010":
                        resultadoDaConversao = ("srl " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(shamt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSrl(rt, shamt), converteReg(rd), 1);
                        break;
                    case "000110":
                        resultadoDaConversao = ("srlv " + "$" + String.valueOf(rd) + " $" + String.valueOf(rt) + " $" + String.valueOf(rs));
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "100010":
                        resultadoDaConversao = ("sub " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSub(rs, rt), converteReg(rd), 1);
                        break;
                    case "100011":
                        resultadoDaConversao = ("subu " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opSub(rs, rt), converteReg(rd), 1);
                        break;
                    case "001100":
                        resultadoDaConversao = ("syscall");
                        jTextMIPS.setText(resultadoDaConversao);
                        break;
                    case "100110":
                        resultadoDaConversao = ("xor " + "$" + String.valueOf(rd) + " $" + String.valueOf(rs) + " $" + String.valueOf(rt));
                        jTextMIPS.setText(resultadoDaConversao);
                        jTableRegistradores.setValueAt(opXor(rs, rt), converteReg(rd), 1);
                        break;
                }
            }
            else {
                if (opcode.equals("000010") || opcode.equals("000011")) {
                    resultadoDaConversao = (instrJ(opcode, codigoBinario));
                    jTextMIPS.setText(resultadoDaConversao);
                    jTextTipo.setText("J");
                }
                else if (!opcode.substring(0, 4).equals("0100")) {
                    jTextTipo.setText("I");
                    rs = String.valueOf(Integer.parseInt(codigoBinario.substring(6, 11), 2));
                    rt = String.valueOf(Integer.parseInt(codigoBinario.substring(11, 16), 2));
                    immediate = String.valueOf(Integer.parseInt(codigoBinario.substring(16, 32), 2));

                    switch(opcode) {
                        case "001000":
                            resultadoDaConversao = (instrItype1("addi", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opAddi(rs, immediate), converteReg(rt), 1);
                            break;
                        case "001001":
                            resultadoDaConversao = (instrItype1("addiu", rt, rs, immediate)); 
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opAddi(rs, immediate), converteReg(rt), 1);
                            break;
                        case "001100":
                            resultadoDaConversao = (instrItype1("andi", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opAndi(rs, immediate), converteReg(rt), 1);
                            break;
                        case "000100":
                            resultadoDaConversao = (instrItype1("beq", rs, rt, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "000001":
                            if (rt.equals("00001")) {
                                resultadoDaConversao = (instrItype2("bgez", rs, immediate));
                                jTextMIPS.setText(resultadoDaConversao);
                            }
                            else if (rt.equals("00000")) {
                                resultadoDaConversao = (instrItype2("bltz", rs, immediate));
                                jTextMIPS.setText(resultadoDaConversao);
                            }
                            else {
                                jTextMIPS.setText("Erro: Instrução do Tipo I inválida");
                            }
                            break;
                        case "000111":
                            if (rt.equals("00000")) {
                                resultadoDaConversao = (instrItype2("bgtz", rs, immediate));
                                jTextMIPS.setText(resultadoDaConversao);
                            }
                            else {
                                jTextMIPS.setText("Erro: Instrução do Tipo I inválida");
                            }
                            break;
                        case "000110":
                            if (rt.equals("00000")) {
                                resultadoDaConversao = (instrItype2("blez", rs, immediate));
                                jTextMIPS.setText(resultadoDaConversao);
                            }
                            else {
                                jTextMIPS.setText("Erro: Instrução do Tipo I inválida");
                            }
                            break;
                        /*case "000001":
                            jTextMIPS.setText(instrItype2("bltz", rs, immediate));
                            break;*/
                        case "000101":
                            resultadoDaConversao = (instrItype1("bne", rs, rt, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "100000":
                            resultadoDaConversao = (instrItype3("lb", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "100100":
                            resultadoDaConversao = (instrItype3("lbu", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "100001":
                            resultadoDaConversao = (instrItype3("lh", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "100101":
                            resultadoDaConversao = (instrItype3("lhu", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "001111":
                            resultadoDaConversao = ("lui " + "$" + rt + " $" + immediate);
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opLui(immediate), converteReg(rt), 1);
                            break;
                        case "100011":
                            resultadoDaConversao = (instrItype3("lw", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "110001":
                            resultadoDaConversao = (instrItype3("lwel", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "001101":
                            resultadoDaConversao = (instrItype1("ori", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opXori(rs, immediate), converteReg(rt), 1);
                            break;
                        case "101000":
                            resultadoDaConversao = (instrItype3("sb", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "001010":
                            resultadoDaConversao = (instrItype1("slti", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opSlti(rs, immediate), converteReg(rt), 1);
                            break;
                        case "001011":
                            resultadoDaConversao = (instrItype1("sltiu", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opSlti(rs, immediate), converteReg(rt), 1);
                            break;
                        case "101001":
                            resultadoDaConversao = (instrItype3("sh", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "101011":
                            resultadoDaConversao = (instrItype3("sw", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "111001":
                            resultadoDaConversao = (instrItype3("swel", rt, immediate, rs));
                            jTextMIPS.setText(resultadoDaConversao);
                            break;
                        case "001110":
                            resultadoDaConversao = (instrItype1("xori", rt, rs, immediate));
                            jTextMIPS.setText(resultadoDaConversao);
                            jTableRegistradores.setValueAt(opXori(rs, immediate), converteReg(rt), 1);
                            break;
                    }
                }
                else {
                    labelErro.setText("opcode inválido");
                }
            }
        }
        else {
            jTextBinario.setEditable(false);
            jTextMIPS.setEditable(true);
            /*codigoMIPS = jTextMIPS.getText();*/
            codigoMIPS = codigoBinario;
            
            instr = codigoMIPS.split(" ")[0];
            codigoMIPS = codigoMIPS.replace("$", "");
            codigoMIPS = codigoMIPS.replace(",", "");
            
            switch(instr) {
                case "add":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100000");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "addu":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100001");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "and":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100100");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "break":
                    resultadoDaConversao = ("000000" + "00000" + "00000" + "00000" + "00000" + "001101");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "div":
                    complementoBin = instrPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "00000" + "011010");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "divu":
                    complementoBin = instrPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "00000" + "011011");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "jalr":
                    rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
                    resultadoDaConversao = ("000000" + dfReg.format(rs) + "00000" + dfReg.format(rd) + "00000" + "001001");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "jr":
                    rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    resultadoDaConversao = ("000000" + dfReg.format(rs) + "00000" + "00000" + "00000" + "001000");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "mfhi":
                    rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    resultadoDaConversao = ("000000" + dfReg.format(rd) + "00000" + "00000" + "00000" + "010000");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "mflo":
                    rd = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    resultadoDaConversao = ("000000" + dfReg.format(rd) + "00000" + "00000" + "00000" + "010010");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "mthi":
                    rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    resultadoDaConversao = ("000000" + dfReg.format(rs) + "00000" + "00000" + "00000" + "010001");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "mtlo":
                    rs = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    resultadoDaConversao = ("000000" + dfReg.format(rs) + "00000" + "00000" + "00000" + "010011");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "mult":
                    complementoBin = instrPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "00000" + "011000");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "multu":
                    complementoBin = instrPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "00000" + "011001");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "nor":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100111");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "or":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100101");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "sll":
                    complementoBin = instrPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000000" + "00000" + complementoBin + "000000");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "sllv":
                    complementoBin = instrPadrao4(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "000100");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "slt":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "101010");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "sltu":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "101011");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "sra":
                    complementoBin = instrPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000000" + "00000" + complementoBin + "000011");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "srav":
                    complementoBin = instrPadrao4(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "000111");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "srl":
                    complementoBin = instrPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000000" + "00000" + complementoBin + "000010");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "srlv":
                    complementoBin = instrPadrao4(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "000110");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "sub":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100010");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "subu":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100011");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "syscall":
                    resultadoDaConversao = ("000000" + "00000" + "00000" + "00000" + "00000" + "001100");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "xor":
                    complementoBin = instrPadrao1(codigoMIPS);
                    resultadoDaConversao = ("000000" + complementoBin + "00000" + "100110");
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("R");
                    break;
                case "j":
                    complementoBin = converteTarget(codigoMIPS);
                    resultadoDaConversao = ("000010" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("J");
                    break;
                case "jal":
                    complementoBin = converteTarget(codigoMIPS);
                    resultadoDaConversao = ("000011" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("J");
                    break;
                case "addi":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001000" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "addiu":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "andi":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001100" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "beq":
                    complementoBin = instrIPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000100" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "bgez":
                    complementoBin = instrIPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000001" + complementoBin.substring(0, 5) + "00000" + complementoBin.substring(10, 26));
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "bgtz":
                    complementoBin = instrIPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000111" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "blez":
                    complementoBin = instrIPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000110" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "bltz":
                    complementoBin = instrIPadrao3(codigoMIPS);
                    resultadoDaConversao = ("000001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "bne":
                    complementoBin = instrIPadrao2(codigoMIPS);
                    resultadoDaConversao = ("000101" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lb":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("100000" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lbu":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("100100" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lh":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("100001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lhu":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("100101" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lui":
                    rt = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[1]));
                    immediate = Integer.toBinaryString(Integer.parseInt(codigoMIPS.split(" ")[2]));
                    resultadoDaConversao = ("001111" + "00000" + dfReg.format(Integer.parseInt(rt)) + dfImm.format(Integer.parseInt(immediate)));
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lw":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("100011" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "lwel":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("110001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "ori":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001101" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "sb":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("101000" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "slti":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001010" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "sltiu":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001011" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "sh":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("101001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "sw":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("101011" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "swel":
                    complementoBin = instrIPadrao4(codigoMIPS);
                    resultadoDaConversao = ("111001" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
                case "xori":
                    complementoBin = instrIPadrao1(codigoMIPS);
                    resultadoDaConversao = ("001110" + complementoBin);
                    jTextBinario.setText(resultadoDaConversao);
                    jTextTipo.setText("I");
                    break;
            }
        }
        
        return resultadoDaConversao;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tipoConversao = new javax.swing.ButtonGroup();
        background = new javax.swing.JPanel();
        labelBinario = new javax.swing.JLabel();
        jTextBinario = new javax.swing.JTextField();
        labelMIPS = new javax.swing.JLabel();
        jTextMIPS = new javax.swing.JTextField();
        jButtonConverter = new javax.swing.JButton();
        jButtonLimpar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTableRegistradores = new javax.swing.JTable();
        labelTipo = new javax.swing.JLabel();
        jTextTipo = new javax.swing.JTextField();
        labelErro = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jRadioBinToMIPS = new javax.swing.JRadioButton();
        jRadioMIPSToBin = new javax.swing.JRadioButton();
        jButtonAbrirArquivo = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextAreaLog = new javax.swing.JTextArea();
        jLabelTextoAleatorioQueNinguemLiga = new javax.swing.JLabel();
        jButtonSalvarArquivo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(0, 0, 0));

        background.setBackground(new java.awt.Color(255, 255, 255));

        labelBinario.setText("Binario");

        labelMIPS.setText("MIPS");

        jButtonConverter.setText("Converter");
        jButtonConverter.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonConverterActionPerformed(evt);
            }
        });

        jButtonLimpar.setText("Limpar");
        jButtonLimpar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonLimparActionPerformed(evt);
            }
        });

        jTableRegistradores.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"0", null},
                {"1", null},
                {"2", null},
                {"3", null},
                {"4", null},
                {"5", null},
                {"6", null},
                {"7", null},
                {"8", null},
                {"9", null},
                {"10", null},
                {"11", null},
                {"12", null},
                {"13", null},
                {"14", null},
                {"15", null},
                {"16", null},
                {"17", null},
                {"18", null},
                {"19", null},
                {"20", null},
                {"21", null},
                {"22", null},
                {"23", null},
                {"24", null},
                {"25", null},
                {"26", null},
                {"27", null},
                {"28", null},
                {"29", null},
                {"30", null},
                {"31", null}
            },
            new String [] {
                "Registrador", "Valor"
            }
        ));
        jScrollPane1.setViewportView(jTableRegistradores);

        labelTipo.setText("Tipo");

        jTextTipo.setEditable(false);

        labelErro.setBackground(new java.awt.Color(51, 51, 255));
        labelErro.setForeground(new java.awt.Color(255, 0, 51));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/arqcomp/01.jpg"))); // NOI18N

        tipoConversao.add(jRadioBinToMIPS);
        jRadioBinToMIPS.setText("Binario para MIPS");
        jRadioBinToMIPS.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioBinToMIPSActionPerformed(evt);
            }
        });

        tipoConversao.add(jRadioMIPSToBin);
        jRadioMIPSToBin.setText("MIPS para Binario");
        jRadioMIPSToBin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioMIPSToBinActionPerformed(evt);
            }
        });

        jButtonAbrirArquivo.setText("Abrir");
        jButtonAbrirArquivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonAbrirArquivoActionPerformed(evt);
            }
        });

        jTextAreaLog.setColumns(20);
        jTextAreaLog.setRows(5);
        jScrollPane2.setViewportView(jTextAreaLog);

        jButtonSalvarArquivo.setText("Salvar");
        jButtonSalvarArquivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonSalvarArquivoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout backgroundLayout = new javax.swing.GroupLayout(background);
        background.setLayout(backgroundLayout);
        backgroundLayout.setHorizontalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(backgroundLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(backgroundLayout.createSequentialGroup()
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(labelMIPS, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(labelBinario, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 50, Short.MAX_VALUE)
                            .addComponent(labelTipo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(backgroundLayout.createSequentialGroup()
                                .addComponent(jTextTipo, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 153, Short.MAX_VALUE)
                                .addComponent(jButtonConverter, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(22, 22, 22)
                                .addComponent(jButtonLimpar, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jTextBinario, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextMIPS, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(18, 18, 18)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jRadioBinToMIPS, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jRadioMIPSToBin, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(labelErro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane2)
                    .addGroup(backgroundLayout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jButtonAbrirArquivo, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jButtonSalvarArquivo, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 177, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabelTextoAleatorioQueNinguemLiga, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        backgroundLayout.setVerticalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(backgroundLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(backgroundLayout.createSequentialGroup()
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextBinario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jRadioBinToMIPS)
                            .addComponent(labelBinario))
                        .addGap(18, 18, 18)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextMIPS, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jRadioMIPSToBin)
                            .addComponent(labelMIPS))
                        .addGap(18, 18, 18)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButtonLimpar)
                            .addComponent(jButtonConverter)
                            .addComponent(labelTipo)
                            .addComponent(jTextTipo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addComponent(labelErro, javax.swing.GroupLayout.PREFERRED_SIZE, 19, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 337, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButtonAbrirArquivo)
                            .addComponent(jButtonSalvarArquivo)))
                    .addGroup(backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addGroup(backgroundLayout.createSequentialGroup()
                            .addComponent(jLabel2)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabelTextoAleatorioQueNinguemLiga, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 540, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
  
    private void jButtonConverterActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonConverterActionPerformed
        /*grandeFuncaoQueFazAPohaToda(boolean tipoDeConversao, String codigoBinario, String opcode)*/
        if (jRadioBinToMIPS.isSelected()) {
            grandeFuncaoQueFazAPohaToda(true, jTextBinario.getText());
        }
        else if (jRadioMIPSToBin.isSelected()) {
            grandeFuncaoQueFazAPohaToda(false, jTextMIPS.getText()); 
        }
    }//GEN-LAST:event_jButtonConverterActionPerformed

    private void jRadioBinToMIPSActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioBinToMIPSActionPerformed
        jTextBinario.setEditable(true);
        jTextMIPS.setEditable(false);
    }//GEN-LAST:event_jRadioBinToMIPSActionPerformed

    private void jRadioMIPSToBinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioMIPSToBinActionPerformed
        jTextBinario.setEditable(false);
        jTextMIPS.setEditable(true);
    }//GEN-LAST:event_jRadioMIPSToBinActionPerformed

    private void jButtonAbrirArquivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonAbrirArquivoActionPerformed
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Escolha um arquivo .txt");
        FileNameExtensionFilter filter = new FileNameExtensionFilter("Arquivo de texto .txt", "txt");
        fileChooser.setFileFilter(filter);
        int variavelParaVerificarSeAlgumArquivoFoiSelecionado = fileChooser.showOpenDialog(this);
        
        if (variavelParaVerificarSeAlgumArquivoFoiSelecionado == JFileChooser.APPROVE_OPTION) {
            File arquivoTexto = fileChooser.getSelectedFile();
            labelErro.setText(arquivoTexto.getPath());
            
            try {
                BufferedReader br = new BufferedReader(new FileReader(arquivoTexto));
                while(br.ready()) {
                    codigoBinario = br.readLine();
                    if (codigoBinario.substring(0, 1).equals("0") || codigoBinario.substring(0, 1).equals("1")) {
                        jTextAreaLog.setText(jTextAreaLog.getText() + codigoBinario + " - " + grandeFuncaoQueFazAPohaToda(true, codigoBinario) + "\n");
                    }
                    else {
                        jTextAreaLog.setText(jTextAreaLog.getText() + codigoBinario + " - " + grandeFuncaoQueFazAPohaToda(false, codigoBinario) + "\n");
                    }
                }
            }
            catch(IOException ioe) {
                ioe.printStackTrace();
            }
        }
    }//GEN-LAST:event_jButtonAbrirArquivoActionPerformed

    private void jButtonLimparActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonLimparActionPerformed
        jTextBinario.setText("");
        jTextMIPS.setText("");
        jTextTipo.setText("");
        jTextAreaLog.setText("");
        labelErro.setText("");
    }//GEN-LAST:event_jButtonLimparActionPerformed

    private void jButtonSalvarArquivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonSalvarArquivoActionPerformed
        String filename = File.separator+"tmp";
        JFileChooser fileChooser = new JFileChooser(new File(filename));
        FileNameExtensionFilter filter = new FileNameExtensionFilter("Arquivo de texto .txt", "txt");
        fileChooser.setFileFilter(filter);
        // Mostra a dialog de save file
        fileChooser.showSaveDialog(this);
        File selFile = fileChooser.getSelectedFile();
        
        labelErro.setText(fileChooser.getSelectedFile().toString());
        FileWriter arquivoGerado;
        try {
            arquivoGerado = new FileWriter(fileChooser.getSelectedFile().toString());
            PrintWriter gravarArquivo = new PrintWriter(arquivoGerado);
            gravarArquivo.printf(jTextAreaLog.getText());
            gravarArquivo.close();
        } catch (IOException ex) {
            Logger.getLogger(InterGraph.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButtonSalvarArquivoActionPerformed
        
    public static void main(String args[]) {

        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(InterGraph.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(InterGraph.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(InterGraph.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(InterGraph.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new InterGraph().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel background;
    private javax.swing.JButton jButtonAbrirArquivo;
    private javax.swing.JButton jButtonConverter;
    private javax.swing.JButton jButtonLimpar;
    private javax.swing.JButton jButtonSalvarArquivo;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabelTextoAleatorioQueNinguemLiga;
    private javax.swing.JRadioButton jRadioBinToMIPS;
    private javax.swing.JRadioButton jRadioMIPSToBin;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTableRegistradores;
    private javax.swing.JTextArea jTextAreaLog;
    private javax.swing.JTextField jTextBinario;
    private javax.swing.JTextField jTextMIPS;
    private javax.swing.JTextField jTextTipo;
    private javax.swing.JLabel labelBinario;
    private javax.swing.JLabel labelErro;
    private javax.swing.JLabel labelMIPS;
    private javax.swing.JLabel labelTipo;
    private javax.swing.ButtonGroup tipoConversao;
    // End of variables declaration//GEN-END:variables
}