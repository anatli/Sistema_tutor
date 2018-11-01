package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class JavitaTest {
    public static List<String> pregs;
    public static List<String> resps;
    public static List<String> elecciones;
    public static int aux;
    public void iniciar(String pregsYresps)throws IOException{
        System.out.println("myfunc");
        pregs=new ArrayList<>();
        resps=new ArrayList<>();
        elecciones=new ArrayList<>();
        aux=0;
        File file=new File(pregsYresps);
        BufferedReader br= new BufferedReader(new FileReader(file));
        String preg,resp;
        while((preg=br.readLine())!=null && (resp=br.readLine())!=null){
            pregs.add(preg); resps.add(resp);
        }
        br.close();       
    }
    public void iniciar1() throws IOException{
        iniciar("pregsYresps.txt");
    }
    public void iniciar2() throws IOException{
        iniciar("pregsYresps2.txt");
    }
    public void iniciar3() throws IOException{
        iniciar("pregsYresps3.txt");
    }
    public String getPreg(int pos){
        return pregs.get(pos);
    }
    public String getElec(int pos){
        return elecciones.get(pos);
    }
    public String getResp(int pos){
        return resps.get(pos);
    }
    public boolean sigPag(){
        if(aux<9)JavitaTest.aux+=3;
        System.out.println("Entramos en sigPag"); 
        return true;
    }
    public void prevPag(){
        if(aux>0)JavitaTest.aux-=3;
        System.out.println("Entramos en prevPag"); 
    }
        
}