import java.io.*;
import java.util.HashMap;

public class stForPARSEC {
    public static void main(String[] args) {
        String[] benchmarks = {"blackscholes","bodytrack","canneal","dedup","facesim","ferret",
                "fluidanimate","freqmine","raytrace","streamcluster","swaptions","vips",
                "x264"};
        //int count = Integer.parseInt(args[0]);
        HashMap<String,HashMap<String,double[]>>  data=new HashMap<>();
//        String s1 = "/run";
//        String s2 = "/run_base_refrate_mytest-m64.0000";
//        String s3 = "/run_base_refspeed_mytest-m64.0000"; //start from 603
        String[] files = {"WarmUpForUbuntu","ResultForUbuntu","WarmUpForGramine",
                "ResultForGramine","WarmUpForSGX","ResultForSGX"};
        for (String s : benchmarks){
            HashMap<String,double[]> hashMap = new HashMap<>();
            data.put(s,hashMap);
        }
        for (int i=0;i< benchmarks.length;i++){
            String url = "";
            url += benchmarks[i];
//            if (i<18)url += "/"+benchmarks[i] + s1 + s2;
//            else url += "/"+benchmarks[i] + s1 + s3;
            //System.out.println(url);
            File folder = new File(url);
            File[] allFile = folder.listFiles();
            assert allFile != null;
            for (String prefix : files){
                double[] two = new double[2];
                for (File f : allFile){
                    if (f.getName().startsWith(prefix)){
                        //System.out.println(f.getName());
                        try{
                            BufferedReader bufferedReader = new BufferedReader(new FileReader(f));
                            String line = null;
                            while ((line = bufferedReader.readLine()) != null){
//                                String[] lines = line.split(" ");
//                                if (lines[0].equals("real")){
//                                    three[0]+=Double.valueOf(lines[1]);
//                                    //System.out.println(three[0]);
//                                }else if (lines[0].equals("user")){
//                                    three[1]+=Double.valueOf(lines[1]);
//                                }else if (lines[0].equals("sys")){
//                                    three[2]+=Double.valueOf(lines[1]);
//                                }
                                String hook = "[HOOKS] Total time spent: ";
                                if (line.startsWith(hook)) {
                                    String[] lines = line.split(hook);
                                    System.out.println(line);
                                    String value = lines[1].substring(0,lines[1].length()-1);
                                    two[1] += Double.valueOf(value);
                                    two[0]++;
                                }
                            }
                            bufferedReader.close();
                        } catch (IOException FNFE){
                            FNFE.printStackTrace();
                        }
                    }
                }
                data.get(benchmarks[i]).put(prefix,two);
            }
        }
        double[][] rate= new double[benchmarks.length][3];
        double[] fina = new double[3];
        for (int i=0;i< benchmarks.length;i++){
            double ubuntu = data.get(benchmarks[i]).get("ResultForUbuntu")[1]/data.get(benchmarks[i]).get("ResultForUbuntu")[0];
            double gramine = data.get(benchmarks[i]).get("ResultForGramine")[1]/data.get(benchmarks[i]).get("ResultForGramine")[0];
            double sgx = data.get(benchmarks[i]).get("ResultForSGX")[1]/data.get(benchmarks[i]).get("ResultForSGX")[0];
            fina[0]+=data.get(benchmarks[i]).get("ResultForUbuntu")[1];
            fina[1]+=data.get(benchmarks[i]).get("ResultForGramine")[1];
            fina[2]+=data.get(benchmarks[i]).get("ResultForSGX")[1];
            rate[i][0]=gramine/ubuntu;
            rate[i][1]=sgx/ubuntu;
            rate[i][2]=sgx/gramine;
        }
        String result="";
        result+="Benchmarks,gramine/ubuntu,sgx/ubuntu,sgx/gramine,Platform,Times,Result,\n";
        result+="ALL,"+fina[1]/fina[0]+","+fina[2]/fina[0]+","+fina[2]/fina[1]+"\n";
        result+=",,,,";
        for (int i=0;i< benchmarks.length;i++){
            String entry1 = benchmarks[i];
            result=result.substring(0,result.length()-4);
            result+=entry1+",";
            result+=rate[i][0]+","+rate[i][1]+","+rate[i][2]+",";
            for (String entry2:files){
                double[] temp = data.get(entry1).get(entry2);
                int num = (int)temp[0] ;
                result+=entry2+","+num+",";
                result+=temp[1]/num+",\n";
                result+=",,,,";
            }
        }
        try {
            File newFile = new File("Result.csv");
            if (!newFile.exists()) {
                newFile.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(newFile);
            fileWriter.write(result);
            fileWriter.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
