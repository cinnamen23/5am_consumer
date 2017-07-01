package org.cg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.cg.domain.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	String namespace = "org.cg.persistence.NoticeDAO";

	@Inject
	SqlSessionTemplate sess;
	
	@Override
	public void create(NoticeVO vo) {
		sess.insert(namespace+".addNotice", vo);
	}
	
	@Override
	public List<NoticeVO> getList() {
		return sess.selectList(namespace+".noticeList");
	}

	

}
