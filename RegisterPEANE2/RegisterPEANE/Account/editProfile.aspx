<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="RegisterPEANE.Account.editProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        &nbsp;แก้ไข ข้อมูลส่วนตัว&nbsp;</p>
    <p>
    </p>
     
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtname" CssClass="col-md-2 control-label">ชื่อ-นามสกุล</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtname" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtmobile" CssClass="col-md-2 control-label">โทรศัพท์</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control" TextMode="Phone" />
                <asp:CheckBox ID="cb_mobile" Text="ไม่เปิดเผยข้อมูล" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmobile"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="f_profile" CssClass="col-md-2 control-label">รูปภาพ Profile</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="f_profile" runat="server"  CssClass="form-control" />
                <%--<asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" TextMode="Email" />--%>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="f_profile"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>> 
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlProg" CssClass="col-md-2 control-label">ภาษา Programmimg</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlProg" runat="server"  CssClass="form-control">
                    <asp:ListItem>--Please Select---</asp:ListItem>
                    <asp:ListItem>C#</asp:ListItem>
                    <asp:ListItem>JAVA</asp:ListItem>
                    <asp:ListItem>PHP</asp:ListItem>
                    <asp:ListItem>Python</asp:ListItem>
                    <asp:ListItem>JavaScript</asp:ListItem>
                </asp:DropDownList> 
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProg"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
     



        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Submit" CssClass="btn btn-default" />
            </div>
        </div>

       


    
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
