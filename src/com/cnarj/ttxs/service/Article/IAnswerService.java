package com.cnarj.ttxs.service.Article;

import java.util.List;

import com.cnarj.ttxs.pojo.comm.ArticleSrc;
import com.cnarj.ttxs.pojo.info.Answer;
import com.cnarj.ttxs.service.IBaseService;


public interface IAnswerService extends IBaseService<Answer, String>{
	/**
	 * 用于测试的service接口
	 * 
	 * @copyright 湖南爱瑞杰科技发展股份有限公司
	 * @author sly
	 * @version 1.0
	 * @since 2011年6月19日16:02:47
	 */
	public List<Answer> getAnswerList(String propertyName, Object Value);
	
	
	public List<Answer> getTopanswer(String answerdate, int number);
	
	
	
	 public List<Answer> getbestanswer(String Isbest, Object question);
	 
	public boolean isExist(String propertyName, Object value,String questionid);
}
