Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2C6CC4D9
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Oct 2019 23:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfJDVf6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Oct 2019 17:35:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46779 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJDVf6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Oct 2019 17:35:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so5406743lfc.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Oct 2019 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYthbBkktNxFNhA79P5qBlET/NRolFGJmUsKm1pDpdU=;
        b=ia8HRhn9/1Kb63Pb1AAPb/dgwBMU5zFZ/1YLS7IUAE9m0YIQWEO2j/RrZdK3RxeSD3
         TtHn7kbGsN7lGIORGHe0PYGozFS6gfKxBMW+UDACqZ7EUlIQIzSIXchUtcZU6uHJcZaz
         3cgHGwnkSZjHnecmmiGhql926ZgQbOIo9K2f/DOZuljvPTdYuNlEV91+UpJOY1IsNaPJ
         mjkuLx7dgkvxGiI6+h4lVXWgsv20J/KWizv0ZPcWW9Hc8BxfYLUvBFDSbYt2VjozwvmW
         X92sfwjd0K+/H3d0P+kHqRwGSJP4UaLdS1MMPfwFy2Fu7iCnWuHc2XOk0zK9OXRfe735
         WXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYthbBkktNxFNhA79P5qBlET/NRolFGJmUsKm1pDpdU=;
        b=LGI5VpizKCL2shWvyd42Jeyw7fVPSHVBebGxaNwgNkM/7o94EuAm5ORm0/l8IRnJxk
         rmVb5zhT4CkrxxIspYG3BmB4BHnuminp5SO48RoOmfHa0XTpovjmyAhKxtc75kjELcDl
         TBG/+JnWFQK93V+p60ZkFvwJD0q66IauQNoX0ijmT/FR711x32MSzsHPFjvWa+LlCcQ/
         exy0tR2P9OCtuv3fIL99lZalYAjoGuqhcOc4J4G88SvZ0d48CSt9OZrEcfnCXM/2uN4z
         52e+jqLh/dYkhBM8N9qShf6gg+7UW7B+xqm+aSeM9iLr4O7NHkCUyWeVbXySQeh5RlL0
         Hs5A==
X-Gm-Message-State: APjAAAWS63m8dGgg7j2KrxD/hNdLbUELpQicEUSJ7iMXC+mNeYhaloVe
        /y1GWgs1Tb1sXg8fFVhQx0I2rv2zrn+VbnLZuS88hg==
X-Google-Smtp-Source: APXvYqze4xi7TbiTueWqhSS4nrOSZaQhkR1K84HJxk9c9uMTj1SYrkWkL0PxrWyDOmIY4NQ2Sl8HEDV0XpI2eV2MksE=
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr9407136lfo.152.1570224954613;
 Fri, 04 Oct 2019 14:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569572448.git.baolin.wang@linaro.org> <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:35:43 +0200
Message-ID: <CACRpkdbVP9MsNZGJNEw3gYvg4bhf75gh6WKDPFcbKK2eQuc_5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 27, 2019 at 10:28 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together, which can simpify the code.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
