package com.dxc.librarymanagement.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

/**
 * The persistent class for the User database table.
 * 
 */
@Entity
@Table(name="User")
//@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "IdUser")
	private int idUser;

	@Column(name = "BorrowedNumber")
	private int borrowedNumber;

	@Column(name = "FullName")
	private String fullName;

	@Column(name = "LimitNumber")
	private int limitNumber;

	@Column(name = "Password")
	private String password;

	@Column(name = "UserName")
	private String userName;

	// bi-directional many-to-one association to BorrowBook
	@OneToMany(mappedBy = "user")
	private List<BorrowBook> borrowBooks;

	// bi-directional many-to-one association to Role
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IdRole", nullable = false)
	private Role role;

	public User() {
	}

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public int getBorrowedNumber() {
		return this.borrowedNumber;
	}

	public void setBorrowedNumber(int borrowedNumber) {
		this.borrowedNumber = borrowedNumber;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getLimitNumber() {
		return this.limitNumber;
	}

	public void setLimitNumber(int limitNumber) {
		this.limitNumber = limitNumber;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<BorrowBook> getBorrowBooks() {
		return this.borrowBooks;
	}

	public void setBorrowBooks(List<BorrowBook> borrowBooks) {
		this.borrowBooks = borrowBooks;
	}

	public BorrowBook addBorrowBook(BorrowBook borrowBook) {
		getBorrowBooks().add(borrowBook);
		borrowBook.setUser(this);

		return borrowBook;
	}

	public BorrowBook removeBorrowBook(BorrowBook borrowBook) {
		getBorrowBooks().remove(borrowBook);
		borrowBook.setUser(null);

		return borrowBook;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}