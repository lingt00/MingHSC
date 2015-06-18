package com.ming800.hsc.BaseUtil;/**
 * Created by IntelliJ IDEA
 * User: zerg on 2015/6/12 16:03.
 * function:
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Random;

/**
 * Created by IntelliJ IDEA
 * User: zerg on 2015/6/12 16:03.
 * function:
 */
@Controller
@RequestMapping("/upload")
public class ImageUpload {

    @RequestMapping(value = "/uploadify",method = RequestMethod.POST)
    public void imageLoad(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/plain");
        request.setCharacterEncoding("utf-8");

        CommonsMultipartResolver mutilpartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (mutilpartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator<String> it = multiRequest.getFileNames();

            while (it.hasNext()) {
                MultipartFile fileDetail = multiRequest.getFile(it.next());
                if (fileDetail != null) {
                    String newName="";//新文件名
                    File findNameFile=null;//查找重名对象

                    //   图片上传路径
                    String uploadPath =request.getSession().getServletContext().getRealPath("/")+"upload/images/";
                    //   图片网络相对路径
                    String imagePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/upload/images/";

                    //   文件夹不存在就自动创建
                    if(!new File(uploadPath).isDirectory())
                        new File(uploadPath).mkdirs();
                    Random rd = new Random();
                    Calendar time = Calendar.getInstance();
                    String destinationfileName=String.valueOf(time.get(Calendar.YEAR))
                            + String.valueOf(time.get(Calendar.MONTH))
                            + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
                            + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
                            + String.valueOf(time.get(Calendar.MINUTE))
                            + String.valueOf(time.get(Calendar.SECOND));


                    String fullname=fileDetail.getOriginalFilename();//源文件全名
                    String type = fileDetail.getContentType();//源文件类型

                    int idx=fullname.lastIndexOf(".");
                    String suffix=fullname.substring(idx);//文件后缀
                    //String name=fullname.substring(0,idx);//文件名字
                    do{
                        String ts=String.valueOf(Calendar.getInstance().getTimeInMillis());
                        newName=destinationfileName+"-"+ts+"r"+String.valueOf(rd.nextInt(10000))+suffix;
                        findNameFile=new File(uploadPath+newName);
                    }while(findNameFile.exists());
                    fileDetail.transferTo(findNameFile);

                    response.getOutputStream().println(imagePath+newName);
                    response.getOutputStream().flush();
                    response.getOutputStream().close();
                }
            }
        }
    }

    @RequestMapping(value = "/uploadImgJson",method = RequestMethod.POST)
    public void uploadImgJson(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        request.setCharacterEncoding("utf-8");

        String fileSize = request.getParameter("fileSize");
        String fileName = request.getParameter("fileName");
        String fileType = request.getParameter("fileType");

        String fileData = request.getParameter("fileData");//Base64编码过的图片数据信息，对字节数组字符串进行Base64解码

        //在自己的项目中构造出一个用于存放用户照片的文件夹
        //   图片上传路径
        String uploadPath =request.getSession().getServletContext().getRealPath("/")+"upload"+File.separator+"images"+File.separator;
        //   图片网络相对路径
        String imagePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/upload/images/";
        //如果此文件夹不存在则创建一个
        //   文件夹不存在就自动创建
        if(!new File(uploadPath).isDirectory())
            new File(uploadPath).mkdirs();

        Random rd = new Random();
        Calendar time = Calendar.getInstance();
        String destinationfileName=String.valueOf(time.get(Calendar.YEAR))
                + String.valueOf(time.get(Calendar.MONTH))
                + String.valueOf(time.get(Calendar.DAY_OF_MONTH))
                + String.valueOf(time.get(Calendar.HOUR_OF_DAY))
                + String.valueOf(time.get(Calendar.MINUTE))
                + String.valueOf(time.get(Calendar.SECOND));

        int idx=fileName.lastIndexOf(".");
        String suffix=fileName.substring(idx);//文件后缀
        String name=fileName.substring(0,idx);//文件名字
        String newName="";//新文件名
        File findNameFile=null;//查找重名对象
        do{
            newName=destinationfileName+"-"+name+"r"+String.valueOf(rd.nextInt(10000))+suffix;
            findNameFile=new File(uploadPath+newName);
        }while(findNameFile.exists());

//            if(!findNameFile.exists()){
//                findNameFile.mkdir();
//            }
            //使用BASE64对图片文件数据进行解码操作
            BASE64Decoder decoder = new BASE64Decoder();
            //通过Base64解密，将图片数据解密成字节数组
            fileData = fileData.substring(fileData.indexOf(',')+1);
            byte[] bytes = decoder.decodeBuffer(fileData);
            //构造字节数组输入流
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
            //读取输入流的数据
            BufferedImage bi = ImageIO.read(bais);
            //将数据信息写进图片文件中
            ImageIO.write(bi, "jpg" , findNameFile);// 不管输出什么格式图片，此处不需改动
            bais.close();

            PrintWriter pw = response.getWriter();
            pw.print(imagePath+newName);
            pw.close();
    }


}
