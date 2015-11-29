defmodule Honeyworth.Mailer do
  use Mailgun.Client, domain: Application.get_env(:honeyworth, :mailgun_domain),
    key: Application.get_env(:honeyworth, :mailgun_key),
    mode: Mix.env,
    test_file_path: "./tmp/mailgun.json"

  @from Application.get_env(:honeyworth, :from_email, "noreply@whatamiworth.io")
  @email Application.get_env(:honeyworth, :admin_email, "whatamiworht@honeypot.io")

  def new_salary_calculation_request(payload) do
    new_salary_calculation_request payload, @email, @from
  end

  defp new_salary_calculation_request(payload, email, from) do
    send_email to: email,
      from: from,
      subject: "New salary calculation request",
      html: Phoenix.View.render_to_string(
        Honeyworth.EmailView,
        "new_salary_calculation_request.html",
        payload
      )
  end
end
