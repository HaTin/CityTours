/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;

import org.apache.struts2.ServletActionContext;

/**
 *
 * @author dell
 */
public class FileUploadAction extends ActionSupport {

    private File file;
    private String fileContentType;
    private String fileFileName;

    public FileUploadAction() {
    }

    public String execute() {
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            String filePath = request.getSession().getServletContext().getRealPath("/img/product/");
            ServletActionContext.getServletContext().log(filePath);
            File fileToCreate = new File(filePath, fileFileName);
            FileUtils.copyFile(file, fileToCreate);
            if(fileToCreate.length() > 0){
            request.setAttribute("msg", "Upload successfully");
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at upload image action " + e.getMessage());
            ServletActionContext.getRequest().setAttribute("msg", "Error please try again ");
        }
        return SUCCESS;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }
}
