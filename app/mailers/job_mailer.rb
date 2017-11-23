class JobMailer < ActionMailer::Base
  #default from: 'afrowebs@gmail.com'
  #layout 'mailer'

  def job_created(profile)#passed argument profile
  	mail(to: "charliewiredu@gmail.com",
  		 from: "notifications@upfrica.com",
  		 subject: "Job Created",
  		 body: "This is my first mailer",
  		)
  	
  end



end
