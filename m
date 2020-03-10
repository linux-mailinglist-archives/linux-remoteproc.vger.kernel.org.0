Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4C31805EE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Mar 2020 19:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCJSK7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Mar 2020 14:10:59 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40552 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgCJSK7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Mar 2020 14:10:59 -0400
Received: by mail-pj1-f68.google.com with SMTP id gv19so767233pjb.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2020 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zsKib0GqynNKua7iAWBmqWACz2JHoCf4kZ0aZVNqsbQ=;
        b=HLZpkhv24sgfXCUG4fX3MIo+Au43vnAfit8xW0HNvvMmiJukq0nlQHasooY+XayfsH
         bPDPnsiOCYxI3bQG7B0B/K/8wZgxUxSAH4dukVWksxBstHWMBiG0AFIKs5cR34NvIry0
         7XpgDvrSHWGOiZ1HYqWiFG8XWhw20Xr6INzc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zsKib0GqynNKua7iAWBmqWACz2JHoCf4kZ0aZVNqsbQ=;
        b=KlMsHmmmyc8k9+i6vpSTFCdx103wgxfEYJgBL4m5GpBWdG7Vk06dilo79XXmAuKPS8
         ZTXtCuMdhggAbBX1azQCqDB1bGwGleynmsLibvIFNGBQFO+Fh9NbVFGPDZZcVLyd8xsO
         +nyEo8SiRmPhcZi6SN2Z0iWhT34tC8u5Rk9boqdF0fTNRLOmC+Ii2P1NhIHYm41b4Oyh
         Ca0gwGTKNGWl6ql8xSDozi0Dkyq55RfT45m3NA60M1eeV/BHY2/gvV82fn9X5ctBjOXE
         fXmLrlv5oRLBmJyVPir+HT4XcNsflrQuk9VaTaOfLTdErkbQREppw7IMP6RhO3yS4pTy
         u06w==
X-Gm-Message-State: ANhLgQ0kXRlXMUGnRJEQeraHnz6lkHfMqwQIt5sPiKJZ9sTs/z+bPpaH
        mBxL2bao5dQ0KbAdeWEN/tec3A==
X-Google-Smtp-Source: ADFU+vvi/bGVsNtmguU66YqisKjD03wxFAZstCH06FyZW30xgi/xqHri6gRo4LARgAX/p5XdWG7+gQ==
X-Received: by 2002:a17:902:ab8f:: with SMTP id f15mr22089420plr.280.1583863857702;
        Tue, 10 Mar 2020 11:10:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e2sm14277262pgv.81.2020.03.10.11.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:10:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-4-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-4-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: qcom: Update PIL relocation info on load
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 11:10:56 -0700
Message-ID: <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:36)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qco=
m_q6v5_adsp.c
> index e953886b2eb7..d5cdff942535 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -164,10 +166,18 @@ static int qcom_adsp_shutdown(struct qcom_adsp *ads=
p)
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>         struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
> +       int ret;
> +
> +       ret =3D qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> +                                   adsp->mem_region, adsp->mem_phys,
> +                                   adsp->mem_size, &adsp->mem_reloc);
> +       if (ret)
> +               return ret;
> =20
> -       return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> -                            adsp->mem_region, adsp->mem_phys, adsp->mem_=
size,
> -                            &adsp->mem_reloc);
> +       /* Failures only affect post mortem debugging, so ignore return v=
alue */
> +       qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_s=
ize);

If the return value was void then the comment wouldn't be necessary and
it would be self documenting as such. Can we do that?
