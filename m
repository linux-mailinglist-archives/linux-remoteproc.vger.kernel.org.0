Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B924F534508
	for <lists+linux-remoteproc@lfdr.de>; Wed, 25 May 2022 22:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345115AbiEYUhP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 25 May 2022 16:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238454AbiEYUhO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 May 2022 16:37:14 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408C057B1B
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 May 2022 13:37:12 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id wh22so43804118ejb.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 May 2022 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=S59PrzgIaU37CxQa5QDcQGpaL0Rzwj8fbrzyvHDTdI/zVjD+h3O5uerBgoRR+sXNw3
         qhCrs5JwAcubuPWUwkk9DCPAOyvIv5jksCWSiDH7GDJ9pyoPv5+d4HjAzFSQsd4UCLtr
         R8SbSioNR0bFddVMlg5P0dhnF5wP1r+k1jeFw++IruD70geGoHHYDl/3/Zf+a7SyLb0T
         ZJ18x2Yb2ZY64UPFu6LT6BIJvFBj4V4tCsXz+7ebbRKD/yc1BwFJSapftTDqfEsPHo+r
         zjjurOw+6I7oYnmxL5S/qgGlk8rpW0wzo8wgv+lh7kJ9QsByvjIhgOmnP1YrtGnedLnL
         bdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=SutCy93eewQhHgkTqnK1NkncjT4ALwRf0JsrYZrkOebAHhfVf2aAVq4UHbP/D60+AO
         ftBXxfcbeo1YTSO9hGW8zIeBvR2dj9KJhJUjpQ0jkqdsDxOomwtkOe66xgDJKfs1l3t4
         2/YEjcPoxnY25cKVCL+jTpf+LXFYMu2GQ8hfmcbDFjXKQsQ+aXdL2IZbbLbcfYlv83DX
         qmgS62Atw7JsMf3hhMGHFj0WA5MgVQ1xTvVLIqzfH58FLhhY2bA3z/cUnV6rdmo4/Me/
         ioE0n3HSG3EqUIPKxJI97ChuUiqI+pCOvDyU/dBY1cWuWs+iJUveSi0ATvCURnfgXPLj
         jvCA==
X-Gm-Message-State: AOAM5314C8+HFyxoFMVou3CAbHyQiURv9adlCn5z6+0h3Q9wt2AFou1M
        H5Eu2wzqqmj/KMTMYY20cZBmbJRThTW0BoxlYuo=
X-Google-Smtp-Source: ABdhPJwLOhrnrjaQZ7ofyYnt8MrQPPjRnFW1WTi0KNijnhLmR/6GbhP89VgDEWEfpoos0F7KDaSGgVNf5lW4eJaTOEs=
X-Received: by 2002:a17:906:58d2:b0:6fd:daa7:3a6e with SMTP id
 e18-20020a17090658d200b006fddaa73a6emr30751345ejs.0.1653511030776; Wed, 25
 May 2022 13:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a26b:0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:37:10
 -0700 (PDT)
From:   Luisa Donstin <luisadonstin@gmail.com>
Date:   Wed, 25 May 2022 22:37:10 +0200
Message-ID: <CA+QBM2qCn-XAXdqKjsj-oqMGhfF2BxirhnFQrj_cPaViXZr0KA@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Luisa Donstin

luisadonstin@gmail.com









----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Luisa Donstin

luisadonstin@gmail.com
