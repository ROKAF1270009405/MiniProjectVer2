package com.teatime.dto;

public class customerServiceDTO {

	private int qnano;        // Q&A �Խñ� ��ȣ
	private String id;        // ���̵�
	private String title;     // ����
	private String content;   // ����
	private int gr;           // �׷�
	private int lev;          // ����
	private int ord;          // ����

	public customerServiceDTO(int qnano, String id, String title, String content, int gr, int lev, int ord) {
		super();
		this.qnano = qnano;
		this.id = id;
		this.title = title;
		this.content = content;
		this.gr = gr;
		this.lev = lev;
		this.ord = ord;
	}

	public customerServiceDTO() {

	}

	public int getQnano() {
		return qnano;
	}

	public void setQnano(int qnano) {
		this.qnano = qnano;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGr() {
		return gr;
	}

	public void setGr(int gr) {
		this.gr = gr;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getOrd() {
		return ord;
	}

	public void setOrd(int ord) {
		this.ord = ord;
	}

} // end customerServiceDTO class
