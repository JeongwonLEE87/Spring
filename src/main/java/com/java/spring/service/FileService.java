package com.java.spring.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.spring.dao.FileDaoInterface;

@Service
public class FileService implements FileServiceInterface {

	@Autowired
	FileDaoInterface fdi;
	
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Integer> fileAdd(HashMap<String, Object> param) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("status", fdi.fileAdd(param));
		return map;
	}

	@Override
	public HashMap<String, Object> fileList() {
		map = new HashMap<String, Object>();
		map.put("list", fdi.fileList());
		return map;
	}

	@Override
	public HashMap<String, Integer> fileOutput(MultipartFile[] file, HttpServletRequest req) {
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();
		map = new HashMap<String, Object>();
		
		for(int i = 0; i < file.length; i++){
			String name = file[i].getOriginalFilename();
			String path2 = "resources/upload/";
			System.out.println(path2 + name);
			try {
				byte[] bytes = file[i].getBytes();
				
				String path = "";
				// 개발 툴에서만 사용 할것!
//				path = "D:/GIT/Spring/src/main/webapp/" + path2;
				path = req.getSession().getServletContext().getRealPath("/") + path2;
				System.out.println(path);
				
				File f = new File(path);
				
				if(f.exists()){
					f = new File(path + name);
					OutputStream out = new FileOutputStream(f);
					out.write(bytes);
					out.close();
					
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("path", path2);
					map.put("name", name);
					map2 = fileAdd(map);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return map2;
	}
	
	

}
