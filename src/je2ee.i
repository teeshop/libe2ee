/*
 * Copyright 2018-2019 T-Systems Multimedia Solutions GmbH
 *
 * This file is part of libe2ee.
 *
 * libe2ee is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * libe2ee is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with libe2ee.  If not, see <http://www.gnu.org/licenses/lgpl>.
 */

%module je2ee
%include "typemaps.i"
%include "std_string.i"
%include "arrays_java.i"
%include "std_vector.i"
%include "std_shared_ptr.i"

%{
#include "e2ee/e2ee.hpp"
using namespace e2ee;
%}

%typemap(out) std::vector<std::byte> %{
  jresult = (*jenv).NewByteArray($1.size());
  (*jenv).SetByteArrayRegion(jresult, 0, $1.size(), (const jbyte*)&$1.at(0));
%}

%typemap(jni) std::vector<std::byte> "jbyteArray"
%typemap(jtype) std::vector<std::byte> "byte[]"
%typemap(jstype) std::vector<std::byte> "byte[]"
%typemap(javain) std::vector<std::byte> "$javainput"
%typemap(javaout) std::vector<std::byte> {
return $jnicall;
}
%include "e2ee/e2ee.hpp"

