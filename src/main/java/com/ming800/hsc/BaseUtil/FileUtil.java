package com.ming800.hsc.BaseUtil;/**
 * Created by IntelliJ IDEA
 * User: zerg on 2015/6/15 10:25.
 * function:
 */

import java.io.*;

/**
 * Created by IntelliJ IDEA
 * User: zerg on 2015/6/15 10:25.
 * function:
 */
public class FileUtil {

    /**获得文件夹File集合
     * @param file 目标目录
     * @return 文件夹File集合
     */
    public static java.io.File[] listFolders(java.io.File file){
        return file.listFiles(new FileFilter(){
            public boolean accept(java.io.File pathname){
                if(pathname.isDirectory())return true;else return false;
            }
        });
    }

    /** 获得文件名,不包括后缀
     * @param f
     * @return
     */
    public static String getName(File f){
        String name=f.getName();
        if(f.isFile()){
            return name.substring(0,name.lastIndexOf("."));
        }
        return null;
    }

    /**获得文件名,不包括后缀
     * @param name
     * @return
     */
    public static String getName(String name){
        return name.substring(0,name.lastIndexOf("."));
    }

    /** 获得文件名的后缀,不包括点
     * @param f
     * @return
     */
    public static String getNameSuffix(File f){
        String name=f.getName();
        if(f.isFile()){
            return name.substring(name.lastIndexOf(".")+1);
        }
        return null;
    }

    /** 获得文件名的后缀,不包括点
     * @param name
     * @return
     */
    public static String getNameSuffix(String name){
        return name.substring(name.lastIndexOf(".")+1);
    }

    /**过滤指定后缀文件对象的集合
     * @param file 目标文件夹
     * @param suffix 后缀 (gif,doc,txt)
     * @return 指定后缀文件对象的集合
     */
    public static java.io.File[] listFileSuffix(java.io.File file,String suffix){
        final String[] suffixs=suffix.split(",");
        return file.listFiles(new FileFilter(){
            public boolean accept(java.io.File pathname){
                if(pathname.isFile()){
                    String name=pathname.getName();
                    for (int i = 0; i < suffixs.length; i++) {
                        if(name.endsWith(suffixs[i]))return true;
                    }
                }
                return false;
            }
        });
    }


    /** 读取文本返回字符串
     * @param target
     * @return
     */
    public static String readTextFile(java.io.File target){
        FileInputStream fis =null;
        BufferedReader br =null;
        StringBuffer result=new StringBuffer();
        if(target.isFile()){
            try {
                String buf="";
                fis = new FileInputStream(target);
                br = new BufferedReader(new InputStreamReader(fis,"utf-8"));
                while ((buf=br.readLine())!=null) {
                    result.append(buf);
                    result.append("\n");
                }
                return result.toString();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e){
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }finally{
                try {
                    if(br!=null)br.close();
                    if(fis!=null)fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result.toString();
    }


    /** 文本字符串写入到文件
     * @param content
     * @param target
     */
    public static void writeTextFile(String content,java.io.File target){
        System.out.println(target.isFile());
        if(content!=null&&!"".equals(content)&&target.isFile()){
            FileOutputStream fos=null;
            Writer out=null;
            try {
                fos = new FileOutputStream(target);
                out = new BufferedWriter(new OutputStreamWriter(fos,"utf-8"));
                out.write(content);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }finally{
                try {
                    if(out!=null)out.close();
                    if(fos!=null)fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }else{
            System.out.println("文本写入文件失败");
        }
    }

    /**复制文件夹至另一个文件夹下
     * @param src
     * @param dest 必须是目录
     * @throws IOException
     */
    public static void copyDirToDir(java.io.File src, java.io.File dest) throws IOException {
        String target=dest.getPath();
        if(src.isDirectory()&&dest.isDirectory()){
            target+=File.separator+src.getName();
        }
        copyFileToDir(src.getPath(),target);
    }

    // 复制文件
    public static void copyFile(File sourceFile,File targetFile)throws IOException{
        // 新建文件输入流并对它进行缓冲
        FileInputStream input = new FileInputStream(sourceFile);
        BufferedInputStream inBuff=new BufferedInputStream(input);

        // 新建文件输出流并对它进行缓冲
        FileOutputStream output = new FileOutputStream(targetFile);
        BufferedOutputStream outBuff=new BufferedOutputStream(output);

        // 缓冲数组
        byte[] b = new byte[1024 * 5];
        int len;
        while ((len =inBuff.read(b)) != -1) {
            outBuff.write(b, 0, len);
        }
        // 刷新此缓冲的输出流
        outBuff.flush();

        //关闭流
        inBuff.close();
        outBuff.close();
        output.close();
        input.close();
    }

    /** sourceDir 文件夹下文件及文件夹复制至targetDir文件夹下
     * @param sourceDir 必须是目录
     * @param targetDir 必须是目录
     * @throws IOException
     */
    public static void copyFileToDir(String sourceDir, String targetDir)throws IOException {
        // 新建目标目录
        (new File(targetDir)).mkdirs();
        // 获取源文件夹当前下的文件或目录
        File[] file = (new File(sourceDir)).listFiles();
        for (int i = 0; i < file.length; i++){
            if (file[i].isFile()){
                //源文件
                File sourceFile=file[i];
                //目标文件
                File targetFile=new File(new File(targetDir).getAbsolutePath()+ File.separator+file[i].getName());
                copyFile(sourceFile,targetFile);
            }
            if (file[i].isDirectory()){
                //准备复制的源文件夹
                String dir1=sourceDir + "/" + file[i].getName();
                //准备复制的目标文件夹
                String dir2=targetDir + "/"+ file[i].getName();
                copyFileToDir(dir1, dir2);
            }
        }
    }

    public static String getProjectSystemPath(){
        String path=new FileUtil().getClass().getResource("/").getPath();
        path=path.substring(1,path.lastIndexOf("WEB-INF"));
        return path;
    }
}
