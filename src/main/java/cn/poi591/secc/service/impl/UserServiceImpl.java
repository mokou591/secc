package cn.poi591.secc.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.UserDao;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.UserService;
import cn.poi591.secc.util.MyUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User login(String username, String password) {
		User user = userDao.findByUsername(username);
		if (user != null && password.equals(user.getPassword())) {
			// 用户名密码正确匹配
			return user;
		} else {
			// 用户名或密码错误
			return null;
		}
	}

	public boolean register(User regUser) {
		User user = userDao.findByUsername(regUser.getUsername());
		if (user == null) {// 不存在该用户
			// 注册用户，向数据库添加
			userDao.add(regUser);
			return true;
		}
		// 注册失败
		return false;
	}

	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	public User findById(Integer id) {
		return userDao.findById(id);
	}

	public boolean updateProfile(User user) {
		userDao.updateProfile(user);
		return true;
	}

	/**
	 * 使用网页提交的图像字符串更新用户头像文件和数据库字段。
	 * @param user 用户
	 * @param imgStr 网页提交的图像字符串
	 * @param path 保存目录(末尾没有文件分隔符)
	 * @return
	 * @throws IOException
	 */
	public User updateAvatar(User user, String imgStr, String path)
			throws IOException {
		String filename = "avatar_" + user.getId() + "_"
				+ System.currentTimeMillis() + ".png";
		userDao.updateAvatarUrl(user, filename);
		// 更新用户数据，头像字段设置为文件名
		MyUtil.writeImageStrToFile(imgStr, new File(path + File.separator
				+ filename));
		// 把原来的图片文件删掉
		String oldAvatarUrl = user.getAvatarUrl();
		if (oldAvatarUrl.equals("avatar")) {
			// 默认头像，不用删
		} else {
			// 删除之前的头像图片
			File oldAvatar = new File(path + File.separator + oldAvatarUrl);
			oldAvatar.delete();
		}
		//更新用户头像字段
		user.setAvatarUrl(filename);
		return user;
	}

}
