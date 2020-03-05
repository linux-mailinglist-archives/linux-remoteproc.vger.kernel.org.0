Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B769717AA54
	for <lists+linux-remoteproc@lfdr.de>; Thu,  5 Mar 2020 17:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgCEQRD (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 5 Mar 2020 11:17:03 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44581 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgCEQRD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Mar 2020 11:17:03 -0500
Received: by mail-io1-f66.google.com with SMTP id u17so7056763iog.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2020 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKjzEJMa9fe0PK3n0GkSSdo/FdjChSUpIwJDlTYh97U=;
        b=QiMaHeiSTJFP6UFJmbCXKjB+4nX0XCEjJu+Rsrs6hvaZ9brVoePcMg71hYOmttDytV
         Dhk1MdOs+qEZGatjDQ4OlqOsagcAfN6ua+iOtlMCg4Vu25OgIbsoGMIkI+TWobK3/lz2
         o78biGJDirONtSS2xRidOq8Mq6L2qZ3tTogPcEaKZ+XxidOZqmPXMBScwoIS6xajXiBn
         MdnAXtKjreVO43RPngwPA8kFjwZfPAjIF/Cfu4tjSQZWDBHgMnCokRplyIQqtnNPKk3z
         v3Xy7ZlT8IAc789E7dXAto/cJFpLbHbSA0H7ZdET+f/HWzkny87uDeD9uBWle7cMAqni
         qjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKjzEJMa9fe0PK3n0GkSSdo/FdjChSUpIwJDlTYh97U=;
        b=hOHLXKzpcYWT3GLFtVNnwXgnjm1MDBV+26GIJWBfztrAHPmn4PXzgS7cxjuUdy2cvX
         SmaTL3Qe7da3AMpJvEQw/0KoY5QduGPZ7TjhW8IzixMmYzxxDamPpta0GsOMvIr0GtjK
         tvYjWEoqTW1BDQ7ZqWPccCu99h8OflSlrDykdq8+bX8jcO64EshysX9u6l8sfOVJt5rZ
         wN3sVbWGNBY9pTRhjWNHVz0n6ei2poFXesK4guuLy5bp2Ug+1PGj/UaGoYbeIBXOdNrP
         0IM+JwvzhOH/RpthNW0l7IVyd4elifutWUjPEjF1eO/Flx4FiSlgL88gejffHZsnqfgM
         pF+g==
X-Gm-Message-State: ANhLgQ3004SYHuooQ8EU1S1JM7Eu3WQ2jefeZJv3OZ0tv8YjVXS2WgOX
        g8DA2EVXBui5xjvIitTZPxhThDLJDHUdj8E5FWoQAQ==
X-Google-Smtp-Source: ADFU+vs/EhZ+fp249v7LdQYx8Y8WWjr0qHKosDWHsPMEx9WRmNCCS8qpg2xo/DQYa5d00clxO7cglhbSPdx+Pwph6Us=
X-Received: by 2002:a5d:9b94:: with SMTP id r20mr7035294iom.140.1583425022687;
 Thu, 05 Mar 2020 08:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com>
In-Reply-To: <20200304142628.8471-1-NShubin@topcon.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 5 Mar 2020 09:16:51 -0700
Message-ID: <CANLsYkzPROdphvmtpZ6YiajZ2dYLrojC-rGYkq4jK2yzTnAJ5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: dummy kick method
To:     Nikita Shubin <NShubin@topcon.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 4 Mar 2020 at 07:25, Nikita Shubin <NShubin@topcon.com> wrote:
>
> add kick method that does nothing, to avoid errors in rproc_virtio_notify.
>
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3e72b6f38d4b..796b6b86550a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -240,9 +240,15 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>         return va;
>  }
>
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +
> +}
> +

If rproc::kick() is empty, how does the MCU know there is packets to
fetch in the virtio queues?

>  static const struct rproc_ops imx_rproc_ops = {
>         .start          = imx_rproc_start,
>         .stop           = imx_rproc_stop,
> +       .kick           = imx_rproc_kick,
>         .da_to_va       = imx_rproc_da_to_va,
>  };
>
> --
> 2.24.1
>
