(***********************************************************************
*                                                                      *
*             This software is part of the padsml package              *
*           Copyright (c) 2006-2011 AT&T Knowledge Ventures            *
*                      and is licensed under the                       *
*                        Common Public License                         *
*                      by AT&T Knowledge Ventures                      *
*                                                                      *
*                A copy of the License is available at                 *
*                    www.padsproj.org/License.html                     *
*                                                                      *
*  This program contains certain software code or other information    *
*  ("AT&T Software") proprietary to AT&T Corp. ("AT&T").  The AT&T     *
*  Software is provided to you "AS IS". YOU ASSUME TOTAL RESPONSIBILITY*
*  AND RISK FOR USE OF THE AT&T SOFTWARE. AT&T DOES NOT MAKE, AND      *
*  EXPRESSLY DISCLAIMS, ANY EXPRESS OR IMPLIED WARRANTIES OF ANY KIND  *
*  WHATSOEVER, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF*
*  MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, WARRANTIES OF  *
*  TITLE OR NON-INFRINGEMENT.  (c) AT&T Corp.  All rights              *
*  reserved.  AT&T is a registered trademark of AT&T Corp.             *
*                                                                      *
*                   Network Services Research Center                   *
*                          AT&T Labs Research                          *
*                           Florham Park NJ                            *
*                                                                      *
*            Yitzhak Mandelbaum <yitzhak@research.att.com>             *
*                  Kenny Zhu <kzhu@cs.princeton.edu>                   *
*                                                                      *
***********************************************************************)
module MBSE = Mbs.MBSEntry

module TDebug = MBSE.Traverse(Debug_tool)
module TXml = MBSE.Traverse(Xml_formatter)
module TAcc = MBSE.Traverse(Acctool)

let (r, pd) = PadsEasy.parse_with MBSE.parse

let _ = print_endline "XML formatter:"
let sXml = TXml.init()
let sXml = TXml.traverse r pd sXml
let _ = print_endline (Xml.to_string_fmt sXml)

let _ = print_endline "\nAccumulator:"
let sAcc = TAcc.init()
let sAcc = TAcc.traverse r pd sAcc
let _ = print_endline (Xml.to_string_fmt (Acctool.state_to_xml sAcc))
