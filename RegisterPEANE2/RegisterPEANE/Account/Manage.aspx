<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="RegisterPEANE.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Change your account settings</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>เปลี่ยนรหัสผ่าน:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>แก้ไขข้อมูลส่วนตัว:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/editProfile" Text="[Manage]" runat="server" />

                    </dd>
                    <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
                    --%>
                    <%--
                    <dt>Phone Number:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Add]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[Change]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[Remove]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    </dl>
                <p>
                </p>
                <dl class="dl-horizontal">
                    <dd>
                    </dd>
                    <li>
                        <br />
                    </li>

                    <dt>ค้นหาข้อมูลสมาชิก&nbsp; นักพัฒนาระบบสารสนเทศ</dt>
                </dl>
                <p>
                    ชื่อ - นามสกุล
                    <asp:TextBox ID="TextBox1" runat="server" Width="229px"></asp:TextBox>
                </p>
                <p>
                    ภาษา programming
                <asp:DropDownList ID="ddlProg" runat="server">
                    <asp:ListItem>--Please Select---</asp:ListItem>
                    <asp:ListItem>C#</asp:ListItem>
                    <asp:ListItem>JAVA</asp:ListItem>
                    <asp:ListItem>PHP</asp:ListItem>
                    <asp:ListItem>Python</asp:ListItem>
                    <asp:ListItem>JavaScript</asp:ListItem>
                </asp:DropDownList> 
                &nbsp; 
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="find" />
                </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Register_ID" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" Width="998px">
                        <Columns>
                              <asp:TemplateField HeaderText="image">
                        <ItemTemplate>
                          <img src='<%# Eval("PicProfile") %>' height="100" width="100" id="imageControl" runat="server" />
                        </ItemTemplate>   
                    </asp:TemplateField>  
                            <asp:BoundField DataField="FullName" HeaderText="ชื่อ-นามสกุล" SortExpression="FullName" />
                            <asp:BoundField DataField="Prog_lang" HeaderText="ภาษา ที่ถนัด" SortExpression="Prog_lang" />
                              <asp:TemplateField HeaderText="เบอร์โทรศัพท์" SortExpression="Mobile">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="เบอร์โทรศัพท์" SortExpression="Mobile" Visible="False">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isShowMobile") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("isShowMobile") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT FullName, Mobile, isShowMobile, PicProfileName, PicProfile, PicProfileNameExt, Prog_lang, Register_ID, createdBy, createdDAte FROM t_Register WHERE (FullName LIKE '%' + @fullname + '%') OR (Prog_lang = @lang)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" Name="fullname" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddlProg" DefaultValue="%" Name="lang" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        Enabled
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        Disabled
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
            </div>
        </div>
    </div>

</asp:Content>
