import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

public class PrivateTest {
    @Test
    public void test1(){
        Md5Hash md5Hash = new Md5Hash("admin", "admin", 3);
        //3fed7a346e430ea4c2aa10250928f4de
        System.out.println(md5Hash.toString());
    }

    @Test
    public void test2(){
        //HashTable中不能存null
        //HashSet中只能存一个null
        HashSet<String> set = new HashSet<>();
        set.add("aa");
        set.add(null);
        set.add("bb");
        set.add(null);
        System.out.println(set.size());
    }

    @Test
    public void test3(){
        List<String> ids = new ArrayList<>();
        String collect = ids.stream().collect(Collectors.joining(","));
        System.out.println(collect);
    }

    @Test
    public void test4(){
        ArrayList<String> a=null;
        if(a!=null&&a.size()>0){
            System.out.println("aaasa");
        }
    }

    @Test
    public void test5(){
        int fl =0;
        String str1 ="zahng/123";
        String replace = str1.replace("，",",");
        String[] str = replace.split(",");
        for(int a=0;a<str.length;a++){
            String[] split = str[a].split("/");
            if(split.length==2){
                try{
                    Integer.parseInt(split[1]);
                }catch (Exception e){
                    fl+=1;
                }
            }else{
                fl+=1;
            }
        }
        if(fl!=0){
            System.out.println("error");
        }else{
            System.out.println("true");
        }
    }

    @Test
    public void test6(){
        String a ="/asdasd/sdgsag/adfa";
        String font = a.substring(0,a.lastIndexOf("/"));
        System.out.println(font);

        String b = "safas.cxva";
        System.out.println(b.substring(0,b.lastIndexOf(".")));
    }

    @Test
    public void test7(){
        HashMap<Integer, Integer> map = new HashMap<>();
        map.put(1,2);
        map.put(3,4);
        Integer integer = map.get(5);
        System.out.println(integer);
    }

    @Test
    public void test8(){
        List<String> s1 = new ArrayList<>();
        List<String> s2 = new LinkedList<>();
        List<String> s3 = new ArrayList<>();
        s1.add("123");
        s1.add("124");
        s1.add("125");
        s2.add("111");
        s2.add("121");
        s3.add("000");
        s1.addAll(s2);
        s1.addAll(s3);
        //s2.add("123");
       // s2.add("234");
        //s1.removeAll(s2);
       // s1.retainAll(s2);
        System.out.println(s1);
    }

    @Test
    public void test9(){
        String department;
        //department = "AA分行-BB支行-办公室";                    AA分行-BB支行
        //department="AA分行-BB支行-CC支行-d办公室";              AA分行-BB支行-CC支行
        //department = "A分行-b部";                              A分行-b部
        //department = "a分行-b支行-c部类";                      a分行-b支行-c部类
        //department = "a部";                                    a部
        //department = "a分行-b分行-c部-d部";                    a分行-b分行-c部-d部
        department = "a分行-b分行-c部-d部-e团队";              //   a分行-b分行-c部-d部-e团队
        String[] split = department.split("-");
        if(split.length!=1){
            department = "";
            List<String> asList = Arrays.asList(split);
            List<String> move = new ArrayList<>();
            for(int i =0;i<asList.size();i++){
                String s = asList.get(i);
                if(i>=1&&(s.contains("处")||s.contains("室"))){
                    for(int j = i;j<asList.size();j++){
                        move.add(asList.get(j));
                    }
                    break;
                }
            }
            List<String> tain = new ArrayList<>(asList);
            tain.removeAll(move);
            for(int i=0;i<tain.size();i++){
                String s = tain.get(i);
                if(i<tain.size()-1){
                    department+=s+"-";
                }else{
                    department+=s;
                }
            }
        }
        System.out.println(department);
    }

    @Test
    public void test10(){
        List<Map<Integer,String>> list = new ArrayList<>();
        HashMap<Integer, String> map = new HashMap<>();
        //map.put(prentId,str);
    }

    @Test
    public void testJson(){
        Dog dog = new Dog();
        dog.setColor("黑色");
        dog.setHasTail(true);
        System.out.println(dog);
    }

    /*@Test
    public void testJson2(){
        String str  = "Dog{color='黑色', hasTail=true}";
        String s = JSON.toJSONString(str);
        Dog dog = JSON.parseObject(s,Dog.class);
        System.out.println(dog);
    }*/

    @Test
    public void testAdd(){
        ArrayList<String> list = new ArrayList<>();
        list.add("asda");
        list.add(0,"ccc");
        list.add(1,"bb");
        System.out.println(list);
    }


    @Test
    public void testFile(){
        File dic= new File("D:\\studymv\\大型分布式基础+高级、高可用集群部署");
        File[] files = dic.listFiles();
        for (File file : files) {
            String name = file.getName();
            String substring = name.substring(name.indexOf("_")+1);
            //file.renameTo(new File(substring));
            String absolutePath = file.getAbsolutePath();
            String substring1 = absolutePath.substring(0, absolutePath.lastIndexOf("\\")+1);
            File file1 = new File(substring1 + substring);
            file.renameTo(file1);
        }
    }
}
