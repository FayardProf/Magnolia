#===============================================================================
#
# Copyright 2018 The InsideLoop Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#===============================================================================

from __future__ import print_function

import lldb
import lldb.formatters.Logger

def __lldb_init_module (debugger, dict):
    debugger.HandleCommand("type synthetic add -x \"ArrayD\" --python-class data_formatters.ArrayProvider")

class ArrayProvider:
    def __init__(self, valobj, internal_dict):
        self.valobj = valobj
        self.data = self.valobj.GetChildMemberWithName('at')
        self.data_type = self.data.GetType().GetPointeeType()
        self.type_size = self.data_type.GetByteSize()
        self.size = self.valobj.GetChildMemberWithName('size').GetValueAsUnsigned(0)
        self.capacity = self.valobj.GetChildMemberWithName('capacity').GetValueAsUnsigned(0)

    def num_children(self):
        return 2 + self.size

    def get_child_at_index(self, index):
        if index < 0:
            return None
        if index >= self.num_children():
            return None
        try:
            my_frame = self.data.frame
            if index == 0:
                x = my_frame.EvaluateExpression('(int)(' + str(self.size) + ')')
                return x.CreateValueFromData('size', x.GetData(), x.GetType())
            elif index == 1:
                x = my_frame.EvaluateExpression('(int)(' + str(self.capacity) + ')')
                return x.CreateValueFromData('capacity', x.GetData(), x.GetType())
            else:
                offset = (index - 2) * self.type_size
                return self.data.CreateChildAtOffset(
                    '[' + str(index - 2) + ']', offset, self.data_type)
        except:
            return None
