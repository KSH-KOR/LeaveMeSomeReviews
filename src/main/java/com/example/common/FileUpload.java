package com.example.common;

import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename="";
        int sizeLimit = 15*1024*1024;
        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest =
                    new MultipartRequest(
                            request,
                            realPath,
                            sizeLimit,
                            "utf-8",
                            new DefaultFileRenamePolicy()
                    );

            filename = multipartRequest.getFilesystemName("profilePicture");

            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");
            if(seq != null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setRate(Integer.parseInt(multipartRequest.getParameter("rate")));
            one.setProfilePicture(multipartRequest.getParameter("profilePicture"));

            if(seq != null && !seq.equals("")){
                BoardDAO dao = new BoardDAO();
                String oldFileName = dao.getPhotoFileName(Integer.parseInt(seq));
                if(filename != null && oldFileName != null){
                    FileUpload.deleteFile(request, oldFileName);
                } else if(filename != null && oldFileName == null){
                    filename = filename;
                }else{
                    filename = oldFileName;
                }
            }
            one.setProfilePicture(filename);
        } catch (IOException e){
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String oldFileName) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + oldFileName);
        if(f.exists()) f.delete();
    }
}
