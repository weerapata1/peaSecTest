using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using RegisterPEANE.Models;

namespace RegisterPEANE.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                PEANE2Entities db = new PEANE2Entities();
                t_Register t = new t_Register();

                t.FullName = txtname.Text.Trim();
                t.Register_ID = Guid.Parse(user.Id);
                t.Mobile = txtmobile.Text.Trim();
                t.Prog_lang = ddlProg.SelectedValue.ToString();


                //*** Update Picture ***'
                if (this.f_profile.HasFile == true)
                {
                    //*** Read Binary Data ***'
                    byte[] imbByte = new byte[f_profile.PostedFile.InputStream.Length + 1];
                    f_profile.PostedFile.InputStream.Read(imbByte, 0, imbByte.Length);

                    //*** MimeType ***'
                    string ExtType = System.IO.Path.GetExtension(f_profile.PostedFile.FileName).ToLower();
                    string strMIME = null;
                    switch (ExtType)
                    {
                        case ".gif":
                            strMIME = "image/gif";
                            break;
                        case ".jpg":
                        case ".jpeg":
                        case ".jpe":
                            strMIME = "image/jpeg";
                            break;
                        case ".png":
                            strMIME = "image/png";
                            break;

                    }

                    t.PicProfileNameExt = strMIME;
                    t.PicProfileName = f_profile.PostedFile.FileName;
                    t.PicProfile = imbByte;
                }

                if (cb_mobile.Checked)
                    t.isShowMobile = 1;
                else
                    t.isShowMobile = 0;


                    t.createdBy = user.UserName;
                t.createdDAte = DateTime.Now;

                db.t_Register.Add(t);
                db.SaveChanges();

                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}