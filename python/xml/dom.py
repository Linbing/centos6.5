#!/usr/bin/python
#  Filename: dom.py
#   Created: 2015-03-09 21:14:49
#      Desc: TODO (some description)
#    Author: linbing, linbing@semptian.com
#   Company: Beijing Semptian


from xml.dom.minidom import parse
from xml.dom import minidom
import xml.dom.minidom
import sys

def parse(argv):
    DOMTree = xml.dom.minidom.parse("a.xml")
    collection=DOMTree.documentElement
    if collection.hasAttribute("name"):
        print " *** %s ***" % collection.getAttribute("name")
    hosts = collection.getElementsByTagName("host")
    for host in hosts:
        if host.hasAttribute("hostname"):
            print "Hostname: %s" % host.getAttribute("hostname")
        ip=host.getElementsByTagName('ip')[0]
        print "IP: %s" % ip.childNodes[0].data
    #property=collection.getElementsByTagName("property")
    #print property 
    #for p in property:
    #    print " ************"
    #    if p.hasAttribute("name"):
    #        print "Name: %s " % p.getAttribute("name")


def create(argv):
    doc = minidom.Document()
    doc.appendChild(doc.createComment("this is a simple xml."))
    booklist = doc.createElement("booklist")
    doc.appendChild(booklist)
    f=file("book.xml","w")
    doc.writexml(f)
    f.close()

if __name__=="__main__":
    parse(sys.argv[1:])
    create(sys.argv[1:])
