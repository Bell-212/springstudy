package com.gdu.app12.service;

import java.util.List;

import com.gdu.app12.dto.ContactDto;

public interface ContactService {
  public int addContact(ContactDto contactDto);
  public int modifyContact(ContactDto contactDto);
  public int deleteContact(int contactNo);
  public List<ContactDto> getContactList();
  public ContactDto getContactByNo(int contactNo);
  public void txTest();
  public void deleteOldestContact();
}
